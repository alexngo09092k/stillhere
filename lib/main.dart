import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttering/fluttering.dart';
import 'package:fluttering_ads/fluttering_ads.dart';
import 'package:fluttering_analytics/analytics/index.dart';
import 'package:fluttering_iap/iap/iap.dart';
import 'package:fluttering_remote_config/fluttering_remote_config.dart';
import 'package:still_here/app.dart';
import 'package:still_here/common/configuration.dart';
import 'package:still_here/core/premium/premium_service.dart';
import 'package:still_here/core/notifications/reminder_helper.dart';
import 'package:still_here/enviroment.dart';
import 'package:still_here/features/greeting/data/greeting_service.dart';
import 'package:still_here/firebase_options.dart';
import 'package:still_here/shared/models/config/bussiness_config/bussiness_config.dart';
import 'package:still_here/shared/providers/app_theme_provider.dart';
import 'package:still_here/utils/ad_revenue_manager.dart';

void main() {
  AwesomeApp(
    app: const App(),
    inAppReview: const InAppReviewConfig(enable: false),
    providers: [
      AwesomeAdvertisement.instance,
      AwesomeIAP.instance,
      AwesomeRemoteConfig.instance,
      AwesomeAnalytics.instance,
      PremiumService.instance,
      AppThemeProvider(themeMode: ThemeMode.system, locale: const Locale('en')),
    ],
    lazyProviders: [],
    onWillInitialize: () async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await Configuration.instance.loadLocalConfig(enviroment);

      AwesomeRemoteConfig.instance.initial(Configuration.instance.remoteConfig);

      return true;
    },
    onDidInitialize: () async {
      await Configuration.instance.loadRemoteConfig();

      Debug.debugMode =
          Configuration.instance.business.appMode == AppMode.debug;

      AwesomeAdvertisement.instance.initial(
        Configuration.instance.advertisement,
      );
      AwesomeIAP.instance.initial(Configuration.instance.iap);
      AwesomeAnalytics.instance.initial(Configuration.instance.analytics);

      // AI (Gemini free tier) — key from env map or dart-define
      _configureAi();

      // Sync premium entitlement after IAP is ready
      await PremiumService.instance.bind();
      await ReminderHelper.instance.init();
      // Reschedule if previously enabled
      if (await ReminderHelper.instance.isEnabled()) {
        final t = await ReminderHelper.instance.getTime();
        await ReminderHelper.instance.updateTime(
          hour: t.hour,
          minute: t.minute,
        );
      }

      AdRevenueManager.instance.bind();

      return true;
    },
  ).run();
}

void _configureAi() {
  // 1) Compile-time: flutter run --dart-define=GEMINI_API_KEY=xxx
  const fromDefine = String.fromEnvironment('GEMINI_API_KEY', defaultValue: '');
  // 2) Local env map (do not commit real keys)
  final fromEnv = (enviroment['ai'] as Map?)?['apiKey'] as String? ?? '';
  // 3) Optional remote-config override can be added later

  final key = fromDefine.isNotEmpty ? fromDefine : fromEnv;
  final model =
      (enviroment['ai'] as Map?)?['model'] as String? ?? 'gemini-2.0-flash';

  GreetingService.instance.geminiApiKey = key;
  GreetingService.instance.geminiModel = model;
  Debug.log(
    '[AI] Gemini configured: key=${key.isEmpty ? "empty" : "set"}, model=$model',
  );
}
