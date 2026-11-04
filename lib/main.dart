import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttering/fluttering.dart';
import 'package:fluttering_ads/fluttering_ads.dart';
import 'package:fluttering_analytics/analytics/index.dart';
import 'package:fluttering_iap/iap/iap.dart';
import 'package:fluttering_remote_config/fluttering_remote_config.dart';
import 'package:still_here/app.dart';
import 'package:still_here/common/configuration.dart';
import 'package:still_here/enviroment.dart';
import 'package:still_here/firebase_options.dart';
import 'package:still_here/models/config/bussiness_config/bussiness_config.dart';
import 'package:still_here/providers/app_theme_provider.dart';

void main() {
  AwesomeApp(
    app: const App(),
    inAppReview: const InAppReviewConfig(enable: false),
    providers: [
      AwesomeAdvertisement.instance,
      AwesomeIAP.instance,
      AwesomeRemoteConfig.instance,
      AwesomeAnalytics.instance,
      AppThemeProvider(themeMode: ThemeMode.light, locale: const Locale('en')),
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

      return true;
    },
  ).run();
}
