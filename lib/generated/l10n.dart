// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `AI greetings are optional. When AI is configured and enabled, a limited prompt is sent to generate a greeting; check-in notes and mood entries are never included. If AI is unavailable or not configured, the app uses local static greetings.`
  String get aboutAiNote {
    return Intl.message(
      'AI greetings are optional. When AI is configured and enabled, a limited prompt is sent to generate a greeting; check-in notes and mood entries are never included. If AI is unavailable or not configured, the app uses local static greetings.',
      name: 'aboutAiNote',
      desc: '',
      args: [],
    );
  }

  /// `About & Privacy`
  String get aboutTitle {
    return Intl.message(
      'About & Privacy',
      name: 'aboutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ad-free experience`
  String get adFreeExperience {
    return Intl.message(
      'Ad-free experience',
      name: 'adFreeExperience',
      desc: '',
      args: [],
    );
  }

  /// `Afternoon`
  String get afternoon {
    return Intl.message(
      'Afternoon',
      name: 'afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Allow AI greetings`
  String get allowAiGreeting {
    return Intl.message(
      'Allow AI greetings',
      name: 'allowAiGreeting',
      desc: '',
      args: [],
    );
  }

  /// `A little space for you`
  String get appTagline {
    return Intl.message(
      'A little space for you',
      name: 'appTagline',
      desc: '',
      args: [],
    );
  }

  /// `Back to home`
  String get backHome {
    return Intl.message(
      'Back to home',
      name: 'backHome',
      desc: '',
      args: [],
    );
  }

  /// `Priority AI greetings`
  String get benefitAiPriority {
    return Intl.message(
      'Priority AI greetings',
      name: 'benefitAiPriority',
      desc: '',
      args: [],
    );
  }

  /// `No more banners & interstitials`
  String get benefitNoAds {
    return Intl.message(
      'No more banners & interstitials',
      name: 'benefitNoAds',
      desc: '',
      args: [],
    );
  }

  /// `Support the development team`
  String get benefitSupportDev {
    return Intl.message(
      'Support the development team',
      name: 'benefitSupportDev',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Check in today`
  String get checkInCta {
    return Intl.message(
      'Check in today',
      name: 'checkInCta',
      desc: '',
      args: [],
    );
  }

  /// `Check-in deleted.`
  String get checkInDeleted {
    return Intl.message(
      'Check-in deleted.',
      name: 'checkInDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Check-in`
  String get checkInTitle {
    return Intl.message(
      'Check-in',
      name: 'checkInTitle',
      desc: '',
      args: [],
    );
  }

  /// `Today's check-in`
  String get checkInToday {
    return Intl.message(
      'Today\'s check-in',
      name: 'checkInToday',
      desc: '',
      args: [],
    );
  }

  /// `Pick what feels closest to you.`
  String get chooseClosest {
    return Intl.message(
      'Pick what feels closest to you.',
      name: 'chooseClosest',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueAction {
    return Intl.message(
      'Continue',
      name: 'continueAction',
      desc: '',
      args: [],
    );
  }

  /// `Daily reminder`
  String get dailyReminder {
    return Intl.message(
      'Daily reminder',
      name: 'dailyReminder',
      desc: '',
      args: [],
    );
  }

  /// `All data has been deleted.`
  String get dataDeleted {
    return Intl.message(
      'All data has been deleted.',
      name: 'dataDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Still Here • Data is stored locally`
  String get dataStaysOnDevice {
    return Intl.message(
      'Still Here • Data is stored locally',
      name: 'dataStaysOnDevice',
      desc: '',
      args: [],
    );
  }

  /// `days checked in\nthis period`
  String get daysCheckedInPeriod {
    return Intl.message(
      'days checked in\nthis period',
      name: 'daysCheckedInPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete all data`
  String get deleteAllData {
    return Intl.message(
      'Delete all data',
      name: 'deleteAllData',
      desc: '',
      args: [],
    );
  }

  /// `Delete all data on this device? This cannot be undone.`
  String get deleteAllDataConfirm {
    return Intl.message(
      'Delete all data on this device? This cannot be undone.',
      name: 'deleteAllDataConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete check-in`
  String get deleteCheckIn {
    return Intl.message(
      'Delete check-in',
      name: 'deleteCheckIn',
      desc: '',
      args: [],
    );
  }

  /// `Delete this day's check-in? This cannot be undone.`
  String get deleteCheckInConfirm {
    return Intl.message(
      'Delete this day\'s check-in? This cannot be undone.',
      name: 'deleteCheckInConfirm',
      desc: '',
      args: [],
    );
  }

  /// `You're doing great 💚`
  String get doingGreat {
    return Intl.message(
      'You\'re doing great 💚',
      name: 'doingGreat',
      desc: '',
      args: [],
    );
  }

  /// `Download now`
  String get downloadNow {
    return Intl.message(
      'Download now',
      name: 'downloadNow',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Enable check-in reminder`
  String get enableCheckInReminder {
    return Intl.message(
      'Enable check-in reminder',
      name: 'enableCheckInReminder',
      desc: '',
      args: [],
    );
  }

  /// `"This is already enough."`
  String get enoughQuote {
    return Intl.message(
      '"This is already enough."',
      name: 'enoughQuote',
      desc: '',
      args: [],
    );
  }

  /// `Evening`
  String get evening {
    return Intl.message(
      'Evening',
      name: 'evening',
      desc: '',
      args: [],
    );
  }

  /// `Export data`
  String get exportData {
    return Intl.message(
      'Export data',
      name: 'exportData',
      desc: '',
      args: [],
    );
  }

  /// `Share a JSON copy of your local check-ins`
  String get exportDataSubtitle {
    return Intl.message(
      'Share a JSON copy of your local check-ins',
      name: 'exportDataSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Could not export data.`
  String get exportFailed {
    return Intl.message(
      'Could not export data.',
      name: 'exportFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to open browser. Please try again.`
  String get failedToOpenBrowserPleaseTryAgain {
    return Intl.message(
      'Failed to open browser. Please try again.',
      name: 'failedToOpenBrowserPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get getStarted {
    return Intl.message(
      'Get started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get goBack {
    return Intl.message(
      'Back',
      name: 'goBack',
      desc: '',
      args: [],
    );
  }

  /// `Hello. Hope everything is going okay for you.`
  String get greetingFallback {
    return Intl.message(
      'Hello. Hope everything is going okay for you.',
      name: 'greetingFallback',
      desc: '',
      args: [],
    );
  }

  /// `The afternoon\nunfolds ✨`
  String get headlineAfternoon {
    return Intl.message(
      'The afternoon\nunfolds ✨',
      name: 'headlineAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Evening is here.\nYou are enough ✨`
  String get headlineEvening {
    return Intl.message(
      'Evening is here.\nYou are enough ✨',
      name: 'headlineEvening',
      desc: '',
      args: [],
    );
  }

  /// `A new morning\nis beginning ✨`
  String get headlineMorning {
    return Intl.message(
      'A new morning\nis beginning ✨',
      name: 'headlineMorning',
      desc: '',
      args: [],
    );
  }

  /// `The middle of\nthe day ✨`
  String get headlineNoon {
    return Intl.message(
      'The middle of\nthe day ✨',
      name: 'headlineNoon',
      desc: '',
      args: [],
    );
  }

  /// `Good afternoon,`
  String get helloAfternoon {
    return Intl.message(
      'Good afternoon,',
      name: 'helloAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good evening,`
  String get helloEvening {
    return Intl.message(
      'Good evening,',
      name: 'helloEvening',
      desc: '',
      args: [],
    );
  }

  /// `Good morning,`
  String get helloMorning {
    return Intl.message(
      'Good morning,',
      name: 'helloMorning',
      desc: '',
      args: [],
    );
  }

  /// `No entries this month yet.\nYou can start whenever you're ready.`
  String get historyEmpty {
    return Intl.message(
      'No entries this month yet.\nYou can start whenever you\'re ready.',
      name: 'historyEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Journal`
  String get historyTitle {
    return Intl.message(
      'Journal',
      name: 'historyTitle',
      desc: '',
      args: [],
    );
  }

  /// `How are you feeling today?`
  String get howAreYouFeeling {
    return Intl.message(
      'How are you feeling today?',
      name: 'howAreYouFeeling',
      desc: '',
      args: [],
    );
  }

  /// `How are you\nfeeling today?`
  String get howAreYouFeelingTitle {
    return Intl.message(
      'How are you\nfeeling today?',
      name: 'howAreYouFeelingTitle',
      desc: '',
      args: [],
    );
  }

  /// `How are you feeling today?`
  String get howAreYouFeelingToday {
    return Intl.message(
      'How are you feeling today?',
      name: 'howAreYouFeelingToday',
      desc: '',
      args: [],
    );
  }

  /// `In-app purchases are temporarily unavailable.`
  String get iapUnavailable {
    return Intl.message(
      'In-app purchases are temporarily unavailable.',
      name: 'iapUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Your days, your real feelings.`
  String get journalSubtitle {
    return Intl.message(
      'Your days, your real feelings.',
      name: 'journalSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get labelDays {
    return Intl.message(
      'Days',
      name: 'labelDays',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get labelOk {
    return Intl.message(
      'Okay',
      name: 'labelOk',
      desc: '',
      args: [],
    );
  }

  /// `Self-care`
  String get labelSelfCare {
    return Intl.message(
      'Self-care',
      name: 'labelSelfCare',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get labelShare {
    return Intl.message(
      'Share',
      name: 'labelShare',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Later`
  String get later {
    return Intl.message(
      'Later',
      name: 'later',
      desc: '',
      args: [],
    );
  }

  /// `Legal`
  String get legalLinks {
    return Intl.message(
      'Legal',
      name: 'legalLinks',
      desc: '',
      args: [],
    );
  }

  /// `Loading plans…`
  String get loadingPlans {
    return Intl.message(
      'Loading plans…',
      name: 'loadingPlans',
      desc: '',
      args: [],
    );
  }

  /// `Look back on your journey`
  String get lookBackJourney {
    return Intl.message(
      'Look back on your journey',
      name: 'lookBackJourney',
      desc: '',
      args: [],
    );
  }

  /// `Looks like your connection is interrupted. Check your network connection and try again.`
  String get looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd {
    return Intl.message(
      'Looks like your connection is interrupted. Check your network connection and try again.',
      name: 'looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd',
      desc: '',
      args: [],
    );
  }

  /// `Month {month}, {year}`
  String monthLabel(String month, String year) {
    return Intl.message(
      'Month $month, $year',
      name: 'monthLabel',
      desc: '',
      args: [month, year],
    );
  }

  /// `Mood distribution`
  String get moodDistribution {
    return Intl.message(
      'Mood distribution',
      name: 'moodDistribution',
      desc: '',
      args: [],
    );
  }

  /// `Morning`
  String get morning {
    return Intl.message(
      'Morning',
      name: 'morning',
      desc: '',
      args: [],
    );
  }

  /// `Journal`
  String get navHistory {
    return Intl.message(
      'Journal',
      name: 'navHistory',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navHome {
    return Intl.message(
      'Home',
      name: 'navHome',
      desc: '',
      args: [],
    );
  }

  /// `Journal`
  String get navJournal {
    return Intl.message(
      'Journal',
      name: 'navJournal',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get navSettings {
    return Intl.message(
      'Settings',
      name: 'navSettings',
      desc: '',
      args: [],
    );
  }

  /// `Insights`
  String get navStats {
    return Intl.message(
      'Insights',
      name: 'navStats',
      desc: '',
      args: [],
    );
  }

  /// `Notification permission is needed for reminders. You can enable it in system Settings.`
  String get needNotificationPermission {
    return Intl.message(
      'Notification permission is needed for reminders. You can enable it in system Settings.',
      name: 'needNotificationPermission',
      desc: '',
      args: [],
    );
  }

  /// `There is no right or wrong answer.\nChoose what feels closest to you.`
  String get noRightOrWrong {
    return Intl.message(
      'There is no right or wrong answer.\nChoose what feels closest to you.',
      name: 'noRightOrWrong',
      desc: '',
      args: [],
    );
  }

  /// `Anything you'd like to note today?`
  String get noteHint {
    return Intl.message(
      'Anything you\'d like to note today?',
      name: 'noteHint',
      desc: '',
      args: [],
    );
  }

  /// `A few lines for yourself…`
  String get noteHintPersonal {
    return Intl.message(
      'A few lines for yourself…',
      name: 'noteHintPersonal',
      desc: '',
      args: [],
    );
  }

  /// `Note (optional)`
  String get noteOptional {
    return Intl.message(
      'Note (optional)',
      name: 'noteOptional',
      desc: '',
      args: [],
    );
  }

  /// `Note is too long (max 500 characters).`
  String get noteTooLong {
    return Intl.message(
      'Note is too long (max 500 characters).',
      name: 'noteTooLong',
      desc: '',
      args: [],
    );
  }

  /// `You don't always have to be fine. You can share in your own way.`
  String get onboard1Body {
    return Intl.message(
      'You don\'t always have to be fine. You can share in your own way.',
      name: 'onboard1Body',
      desc: '',
      args: [],
    );
  }

  /// `A small pause each day`
  String get onboard1Title {
    return Intl.message(
      'A small pause each day',
      name: 'onboard1Title',
      desc: '',
      args: [],
    );
  }

  /// `A gentle hello and a place to note how you feel — just for you.`
  String get onboard2Body {
    return Intl.message(
      'A gentle hello and a place to note how you feel — just for you.',
      name: 'onboard2Body',
      desc: '',
      args: [],
    );
  }

  /// `Private greeting & check-in`
  String get onboard2Title {
    return Intl.message(
      'Private greeting & check-in',
      name: 'onboard2Title',
      desc: '',
      args: [],
    );
  }

  /// `No account, no required cloud. You're fully in control.`
  String get onboard3Body {
    return Intl.message(
      'No account, no required cloud. You\'re fully in control.',
      name: 'onboard3Body',
      desc: '',
      args: [],
    );
  }

  /// `Your data stays on your device`
  String get onboard3Title {
    return Intl.message(
      'Your data stays on your device',
      name: 'onboard3Title',
      desc: '',
      args: [],
    );
  }

  /// `Open in browser`
  String get openBrowser {
    return Intl.message(
      'Open in browser',
      name: 'openBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Open Settings`
  String get openSettings {
    return Intl.message(
      'Open Settings',
      name: 'openSettings',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get premium {
    return Intl.message(
      'Premium',
      name: 'premium',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get premiumActive {
    return Intl.message(
      'Active',
      name: 'premiumActive',
      desc: '',
      args: [],
    );
  }

  /// `Premium is active on this device.`
  String get premiumActiveOnDevice {
    return Intl.message(
      'Premium is active on this device.',
      name: 'premiumActiveOnDevice',
      desc: '',
      args: [],
    );
  }

  /// `Remove all ads and support StillHere development.`
  String get premiumSupportDesc {
    return Intl.message(
      'Remove all ads and support StillHere development.',
      name: 'premiumSupportDesc',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for supporting StillHere. Ads have been removed.`
  String get premiumThanks {
    return Intl.message(
      'Thanks for supporting StillHere. Ads have been removed.',
      name: 'premiumThanks',
      desc: '',
      args: [],
    );
  }

  /// `Presence rate`
  String get presenceRate {
    return Intl.message(
      'Presence rate',
      name: 'presenceRate',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message(
      'Privacy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Check-ins and notes are stored locally in the app. Still Here does not require an account. We do not send your notes or mood status to analytics. Depending on your operating-system backup settings, app data may be included in device backups. You can export or delete data in Settings.`
  String get privacyBody {
    return Intl.message(
      'Check-ins and notes are stored locally in the app. Still Here does not require an account. We do not send your notes or mood status to analytics. Depending on your operating-system backup settings, app data may be included in device backups. You can export or delete data in Settings.',
      name: 'privacyBody',
      desc: '',
      args: [],
    );
  }

  /// `Could not purchase: {error}`
  String purchaseFailed(String error) {
    return Intl.message(
      'Could not purchase: $error',
      name: 'purchaseFailed',
      desc: '',
      args: [error],
    );
  }

  /// `Purchase not completed. Try again or restore purchases.`
  String get purchaseIncomplete {
    return Intl.message(
      'Purchase not completed. Try again or restore purchases.',
      name: 'purchaseIncomplete',
      desc: '',
      args: [],
    );
  }

  /// `Premium unlocked. Thank you!`
  String get purchaseSuccess {
    return Intl.message(
      'Premium unlocked. Thank you!',
      name: 'purchaseSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Recent entries`
  String get recentEntries {
    return Intl.message(
      'Recent entries',
      name: 'recentEntries',
      desc: '',
      args: [],
    );
  }

  /// `Remind at {time} every day`
  String reminderAt(String time) {
    return Intl.message(
      'Remind at $time every day',
      name: 'reminderAt',
      desc: '',
      args: [time],
    );
  }

  /// `Off`
  String get reminderOff {
    return Intl.message(
      'Off',
      name: 'reminderOff',
      desc: '',
      args: [],
    );
  }

  /// `Reminder time`
  String get reminderTime {
    return Intl.message(
      'Reminder time',
      name: 'reminderTime',
      desc: '',
      args: [],
    );
  }

  /// `Remove ads / Premium`
  String get removeAdsPremium {
    return Intl.message(
      'Remove ads / Premium',
      name: 'removeAdsPremium',
      desc: '',
      args: [],
    );
  }

  /// `No previous purchases found.`
  String get restoreEmpty {
    return Intl.message(
      'No previous purchases found.',
      name: 'restoreEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Restore failed: {error}`
  String restoreFailed(String error) {
    return Intl.message(
      'Restore failed: $error',
      name: 'restoreFailed',
      desc: '',
      args: [error],
    );
  }

  /// `Restore purchases`
  String get restorePurchases {
    return Intl.message(
      'Restore purchases',
      name: 'restorePurchases',
      desc: '',
      args: [],
    );
  }

  /// `Premium restored successfully.`
  String get restoreSuccess {
    return Intl.message(
      'Premium restored successfully.',
      name: 'restoreSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't save. Please try again.`
  String get saveFailed {
    return Intl.message(
      'Couldn\'t save. Please try again.',
      name: 'saveFailed',
      desc: '',
      args: [],
    );
  }

  /// `Save for myself`
  String get saveForMyself {
    return Intl.message(
      'Save for myself',
      name: 'saveForMyself',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get sectionAbout {
    return Intl.message(
      'About',
      name: 'sectionAbout',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String get sectionData {
    return Intl.message(
      'Data',
      name: 'sectionData',
      desc: '',
      args: [],
    );
  }

  /// `Greeting`
  String get sectionGreeting {
    return Intl.message(
      'Greeting',
      name: 'sectionGreeting',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get sectionPremium {
    return Intl.message(
      'Premium',
      name: 'sectionPremium',
      desc: '',
      args: [],
    );
  }

  /// `Reminders`
  String get sectionReminder {
    return Intl.message(
      'Reminders',
      name: 'sectionReminder',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get segmentMonth {
    return Intl.message(
      'Month',
      name: 'segmentMonth',
      desc: '',
      args: [],
    );
  }

  /// `Week`
  String get segmentWeek {
    return Intl.message(
      'Week',
      name: 'segmentWeek',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get segmentYear {
    return Intl.message(
      'Year',
      name: 'segmentYear',
      desc: '',
      args: [],
    );
  }

  /// `You are taking care of yourself beautifully`
  String get selfCareMessage {
    return Intl.message(
      'You are taking care of yourself beautifully',
      name: 'selfCareMessage',
      desc: '',
      args: [],
    );
  }

  /// `A little corner of your own.`
  String get settingsSubtitle {
    return Intl.message(
      'A little corner of your own.',
      name: 'settingsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `A little space for you`
  String get splashTagline {
    return Intl.message(
      'A little space for you',
      name: 'splashTagline',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get statusOk {
    return Intl.message(
      'Okay',
      name: 'statusOk',
      desc: '',
      args: [],
    );
  }

  /// `And that is enough.`
  String get statusOkSubtitle {
    return Intl.message(
      'And that is enough.',
      name: 'statusOkSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `I'm okay.`
  String get statusOkTitle {
    return Intl.message(
      'I\'m okay.',
      name: 'statusOkTitle',
      desc: '',
      args: [],
    );
  }

  /// `Need self-care`
  String get statusSelfCare {
    return Intl.message(
      'Need self-care',
      name: 'statusSelfCare',
      desc: '',
      args: [],
    );
  }

  /// `Gentle space for yourself.`
  String get statusSelfCareSubtitle {
    return Intl.message(
      'Gentle space for yourself.',
      name: 'statusSelfCareSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `I need a bit more care today.`
  String get statusSelfCareTitle {
    return Intl.message(
      'I need a bit more care today.',
      name: 'statusSelfCareTitle',
      desc: '',
      args: [],
    );
  }

  /// `Want to share`
  String get statusShare {
    return Intl.message(
      'Want to share',
      name: 'statusShare',
      desc: '',
      args: [],
    );
  }

  /// `Something to say to yourself.`
  String get statusShareSubtitle {
    return Intl.message(
      'Something to say to yourself.',
      name: 'statusShareSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `I want to share a little.`
  String get statusShareTitle {
    return Intl.message(
      'I want to share a little.',
      name: 'statusShareTitle',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for taking\na moment for yourself.`
  String get thankYouCheckIn {
    return Intl.message(
      'Thank you for taking\na moment for yourself.',
      name: 'thankYouCheckIn',
      desc: '',
      args: [],
    );
  }

  /// `Thank you\nfor being here.`
  String get thankYouForBeingHere {
    return Intl.message(
      'Thank you\nfor being here.',
      name: 'thankYouForBeingHere',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for taking a moment\nfor yourself.`
  String get thankYouMoment {
    return Intl.message(
      'Thank you for taking a moment\nfor yourself.',
      name: 'thankYouMoment',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get themeDark {
    return Intl.message(
      'Dark',
      name: 'themeDark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get themeLight {
    return Intl.message(
      'Light',
      name: 'themeLight',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get themeSystem {
    return Intl.message(
      'System',
      name: 'themeSystem',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Today's note`
  String get todaysNote {
    return Intl.message(
      'Today\'s note',
      name: 'todaysNote',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade to Premium`
  String get upgradePremium {
    return Intl.message(
      'Upgrade to Premium',
      name: 'upgradePremium',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade to remove ads`
  String get upgradeToRemoveAds {
    return Intl.message(
      'Upgrade to remove ads',
      name: 'upgradeToRemoveAds',
      desc: '',
      args: [],
    );
  }

  /// `Use AI greetings`
  String get useAiGreeting {
    return Intl.message(
      'Use AI greetings',
      name: 'useAiGreeting',
      desc: '',
      args: [],
    );
  }

  /// `Turn off to always use local greetings`
  String get useAiGreetingSubtitle {
    return Intl.message(
      'Turn off to always use local greetings',
      name: 'useAiGreetingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Version {version}`
  String versionLabel(String version) {
    return Intl.message(
      'Version $version',
      name: 'versionLabel',
      desc: '',
      args: [version],
    );
  }

  /// `View your journey`
  String get viewHistory {
    return Intl.message(
      'View your journey',
      name: 'viewHistory',
      desc: '',
      args: [],
    );
  }

  /// `View your journey`
  String get viewJourney {
    return Intl.message(
      'View your journey',
      name: 'viewJourney',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to write a little more?`
  String get writeMorePrompt {
    return Intl.message(
      'Would you like to write a little more?',
      name: 'writeMorePrompt',
      desc: '',
      args: [],
    );
  }

  /// `You're currently offline`
  String get youAreCurrentlyOffline {
    return Intl.message(
      'You\'re currently offline',
      name: 'youAreCurrentlyOffline',
      desc: '',
      args: [],
    );
  }

  /// `You're on Premium`
  String get youArePremium {
    return Intl.message(
      'You\'re on Premium',
      name: 'youArePremium',
      desc: '',
      args: [],
    );
  }

  /// `Your app is outdated. Please update to continue.`
  String get yourAppIsOutdated {
    return Intl.message(
      'Your app is outdated. Please update to continue.',
      name: 'yourAppIsOutdated',
      desc: '',
      args: [],
    );
  }

  /// `Your app version is no longer supported. You're missing out on new features and improvements.`
  String get yourAppVersionIsNoLongerSupportedYoureMissingOut {
    return Intl.message(
      'Your app version is no longer supported. You\'re missing out on new features and improvements.',
      name: 'yourAppVersionIsNoLongerSupportedYoureMissingOut',
      desc: '',
      args: [],
    );
  }

  /// `Your journal`
  String get yourJournal {
    return Intl.message(
      'Your journal',
      name: 'yourJournal',
      desc: '',
      args: [],
    );
  }

  /// `You're enough ♡`
  String get youreEnough {
    return Intl.message(
      'You\'re enough ♡',
      name: 'youreEnough',
      desc: '',
      args: [],
    );
  }

  /// `{count}-day streak`
  String streakDays(int count) {
    return Intl.message(
      '$count-day streak',
      name: 'streakDays',
      desc: '',
      args: [count],
    );
  }

  /// `{count} days present`
  String daysPresent(int count) {
    return Intl.message(
      '$count days present',
      name: 'daysPresent',
      desc: '',
      args: [count],
    );
  }

  /// `Best {count}`
  String bestStreak(int count) {
    return Intl.message(
      'Best $count',
      name: 'bestStreak',
      desc: '',
      args: [count],
    );
  }

  /// `{count} total`
  String totalDaysShort(int count) {
    return Intl.message(
      '$count total',
      name: 'totalDaysShort',
      desc: '',
      args: [count],
    );
  }

  /// `Full insights & longer history`
  String get benefitFullInsights {
    return Intl.message(
      'Full insights & longer history',
      name: 'benefitFullInsights',
      desc: '',
      args: [],
    );
  }

  /// `Export your private journal anytime`
  String get benefitExportJournal {
    return Intl.message(
      'Export your private journal anytime',
      name: 'benefitExportJournal',
      desc: '',
      args: [],
    );
  }

  /// `Notice one thing that is okay enough right now. Let it be enough for this moment.`
  String get tipAfterOk {
    return Intl.message(
      'Notice one thing that is okay enough right now. Let it be enough for this moment.',
      name: 'tipAfterOk',
      desc: '',
      args: [],
    );
  }

  /// `Whatever you are carrying is allowed here. You showed up — that already counts.`
  String get tipAfterShare {
    return Intl.message(
      'Whatever you are carrying is allowed here. You showed up — that already counts.',
      name: 'tipAfterShare',
      desc: '',
      args: [],
    );
  }

  /// `A soft idea: place a hand on your chest and take three slow breaths. You do not have to fix everything today.`
  String get tipAfterSelfCare {
    return Intl.message(
      'A soft idea: place a hand on your chest and take three slow breaths. You do not have to fix everything today.',
      name: 'tipAfterSelfCare',
      desc: '',
      args: [],
    );
  }

  /// `What felt a little softer today?`
  String get promptGeneral1 {
    return Intl.message(
      'What felt a little softer today?',
      name: 'promptGeneral1',
      desc: '',
      args: [],
    );
  }

  /// `Is there one thing you handled kindly?`
  String get promptGeneral2 {
    return Intl.message(
      'Is there one thing you handled kindly?',
      name: 'promptGeneral2',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to leave behind for tonight?`
  String get promptGeneral3 {
    return Intl.message(
      'What do you want to leave behind for tonight?',
      name: 'promptGeneral3',
      desc: '',
      args: [],
    );
  }

  /// `Who or what made you feel less alone?`
  String get promptGeneral4 {
    return Intl.message(
      'Who or what made you feel less alone?',
      name: 'promptGeneral4',
      desc: '',
      args: [],
    );
  }

  /// `What would “enough” look like right now?`
  String get promptGeneral5 {
    return Intl.message(
      'What would “enough” look like right now?',
      name: 'promptGeneral5',
      desc: '',
      args: [],
    );
  }

  /// `What is supporting this calm?`
  String get promptOk1 {
    return Intl.message(
      'What is supporting this calm?',
      name: 'promptOk1',
      desc: '',
      args: [],
    );
  }

  /// `Name one small win you almost overlooked.`
  String get promptOk2 {
    return Intl.message(
      'Name one small win you almost overlooked.',
      name: 'promptOk2',
      desc: '',
      args: [],
    );
  }

  /// `How can you protect this energy tomorrow?`
  String get promptOk3 {
    return Intl.message(
      'How can you protect this energy tomorrow?',
      name: 'promptOk3',
      desc: '',
      args: [],
    );
  }

  /// `What would you say if a friend felt this way?`
  String get promptShare1 {
    return Intl.message(
      'What would you say if a friend felt this way?',
      name: 'promptShare1',
      desc: '',
      args: [],
    );
  }

  /// `Which part of today needs a little more room?`
  String get promptShare2 {
    return Intl.message(
      'Which part of today needs a little more room?',
      name: 'promptShare2',
      desc: '',
      args: [],
    );
  }

  /// `What emotion is asking to be named?`
  String get promptShare3 {
    return Intl.message(
      'What emotion is asking to be named?',
      name: 'promptShare3',
      desc: '',
      args: [],
    );
  }

  /// `What would feel caring in the next hour?`
  String get promptSelfCare1 {
    return Intl.message(
      'What would feel caring in the next hour?',
      name: 'promptSelfCare1',
      desc: '',
      args: [],
    );
  }

  /// `Where can you ask for less of yourself today?`
  String get promptSelfCare2 {
    return Intl.message(
      'Where can you ask for less of yourself today?',
      name: 'promptSelfCare2',
      desc: '',
      args: [],
    );
  }

  /// `What boundary would help you rest?`
  String get promptSelfCare3 {
    return Intl.message(
      'What boundary would help you rest?',
      name: 'promptSelfCare3',
      desc: '',
      args: [],
    );
  }

  /// `Care`
  String get navCare {
    return Intl.message(
      'Care',
      name: 'navCare',
      desc: '',
      args: [],
    );
  }

  /// `Care`
  String get careTitle {
    return Intl.message(
      'Care',
      name: 'careTitle',
      desc: '',
      args: [],
    );
  }

  /// `Exercises, gentle ideas and your milestones`
  String get careSubtitle {
    return Intl.message(
      'Exercises, gentle ideas and your milestones',
      name: 'careSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Today's note`
  String get careTodaysNote {
    return Intl.message(
      'Today\'s note',
      name: 'careTodaysNote',
      desc: '',
      args: [],
    );
  }

  /// `Breathing & grounding`
  String get breathingGroundingTitle {
    return Intl.message(
      'Breathing & grounding',
      name: 'breathingGroundingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do these when you need to settle`
  String get breathingGroundingSubtitle {
    return Intl.message(
      'Do these when you need to settle',
      name: 'breathingGroundingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions for today`
  String get suggestionsForTodayTitle {
    return Intl.message(
      'Suggestions for today',
      name: 'suggestionsForTodayTitle',
      desc: '',
      args: [],
    );
  }

  /// `Based on how you have been feeling`
  String get suggestionsForTodaySubtitle {
    return Intl.message(
      'Based on how you have been feeling',
      name: 'suggestionsForTodaySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Milestones`
  String get milestonesTitle {
    return Intl.message(
      'Milestones',
      name: 'milestonesTitle',
      desc: '',
      args: [],
    );
  }

  /// `{unlocked}/{total} unlocked`
  String milestonesUnlocked(int unlocked, int total) {
    return Intl.message(
      '$unlocked/$total unlocked',
      name: 'milestonesUnlocked',
      desc: '',
      args: [unlocked, total],
    );
  }

  /// `{minutes} min`
  String minutesLabel(int minutes) {
    return Intl.message(
      '$minutes min',
      name: 'minutesLabel',
      desc: '',
      args: [minutes],
    );
  }

  /// `Today was about… (optional)`
  String get activityTagsPrompt {
    return Intl.message(
      'Today was about… (optional)',
      name: 'activityTagsPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get tagWork {
    return Intl.message(
      'Work',
      name: 'tagWork',
      desc: '',
      args: [],
    );
  }

  /// `Family`
  String get tagFamily {
    return Intl.message(
      'Family',
      name: 'tagFamily',
      desc: '',
      args: [],
    );
  }

  /// `Friends`
  String get tagFriends {
    return Intl.message(
      'Friends',
      name: 'tagFriends',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get tagHealth {
    return Intl.message(
      'Health',
      name: 'tagHealth',
      desc: '',
      args: [],
    );
  }

  /// `Rest`
  String get tagRest {
    return Intl.message(
      'Rest',
      name: 'tagRest',
      desc: '',
      args: [],
    );
  }

  /// `Hobby`
  String get tagHobby {
    return Intl.message(
      'Hobby',
      name: 'tagHobby',
      desc: '',
      args: [],
    );
  }

  /// `Study`
  String get tagStudy {
    return Intl.message(
      'Study',
      name: 'tagStudy',
      desc: '',
      args: [],
    );
  }

  /// `Outdoor`
  String get tagOutdoor {
    return Intl.message(
      'Outdoor',
      name: 'tagOutdoor',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get tagFood {
    return Intl.message(
      'Food',
      name: 'tagFood',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get tagOther {
    return Intl.message(
      'Other',
      name: 'tagOther',
      desc: '',
      args: [],
    );
  }

  /// `Still Here`
  String get reminderNotificationTitle {
    return Intl.message(
      'Still Here',
      name: 'reminderNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `A small hello is waiting for you.`
  String get reminderNotificationBody {
    return Intl.message(
      'A small hello is waiting for you.',
      name: 'reminderNotificationBody',
      desc: '',
      args: [],
    );
  }

  /// `Journey begins`
  String get achievementFirstCheckinTitle {
    return Intl.message(
      'Journey begins',
      name: 'achievementFirstCheckinTitle',
      desc: '',
      args: [],
    );
  }

  /// `Complete your first check-in`
  String get achievementFirstCheckinDesc {
    return Intl.message(
      'Complete your first check-in',
      name: 'achievementFirstCheckinDesc',
      desc: '',
      args: [],
    );
  }

  /// `3-day streak`
  String get achievementStreak3Title {
    return Intl.message(
      '3-day streak',
      name: 'achievementStreak3Title',
      desc: '',
      args: [],
    );
  }

  /// `Check in 3 days in a row`
  String get achievementStreak3Desc {
    return Intl.message(
      'Check in 3 days in a row',
      name: 'achievementStreak3Desc',
      desc: '',
      args: [],
    );
  }

  /// `Gentle week`
  String get achievementStreak7Title {
    return Intl.message(
      'Gentle week',
      name: 'achievementStreak7Title',
      desc: '',
      args: [],
    );
  }

  /// `Check in 7 days in a row`
  String get achievementStreak7Desc {
    return Intl.message(
      'Check in 7 days in a row',
      name: 'achievementStreak7Desc',
      desc: '',
      args: [],
    );
  }

  /// `Two weeks present`
  String get achievementStreak14Title {
    return Intl.message(
      'Two weeks present',
      name: 'achievementStreak14Title',
      desc: '',
      args: [],
    );
  }

  /// `Check in 14 days in a row`
  String get achievementStreak14Desc {
    return Intl.message(
      'Check in 14 days in a row',
      name: 'achievementStreak14Desc',
      desc: '',
      args: [],
    );
  }

  /// `A month here`
  String get achievementStreak30Title {
    return Intl.message(
      'A month here',
      name: 'achievementStreak30Title',
      desc: '',
      args: [],
    );
  }

  /// `Check in 30 days in a row`
  String get achievementStreak30Desc {
    return Intl.message(
      'Check in 30 days in a row',
      name: 'achievementStreak30Desc',
      desc: '',
      args: [],
    );
  }

  /// `10 moments of listening`
  String get achievementTotal10Title {
    return Intl.message(
      '10 moments of listening',
      name: 'achievementTotal10Title',
      desc: '',
      args: [],
    );
  }

  /// `10 total check-in days`
  String get achievementTotal10Desc {
    return Intl.message(
      '10 total check-in days',
      name: 'achievementTotal10Desc',
      desc: '',
      args: [],
    );
  }

  /// `30 days of care`
  String get achievementTotal30Title {
    return Intl.message(
      '30 days of care',
      name: 'achievementTotal30Title',
      desc: '',
      args: [],
    );
  }

  /// `30 total check-in days`
  String get achievementTotal30Desc {
    return Intl.message(
      '30 total check-in days',
      name: 'achievementTotal30Desc',
      desc: '',
      args: [],
    );
  }

  /// `100 days still here`
  String get achievementTotal100Title {
    return Intl.message(
      '100 days still here',
      name: 'achievementTotal100Title',
      desc: '',
      args: [],
    );
  }

  /// `100 total check-in days`
  String get achievementTotal100Desc {
    return Intl.message(
      '100 total check-in days',
      name: 'achievementTotal100Desc',
      desc: '',
      args: [],
    );
  }

  /// `The writer`
  String get achievementNoteWriterTitle {
    return Intl.message(
      'The writer',
      name: 'achievementNoteWriterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Write a note on 5 check-ins`
  String get achievementNoteWriterDesc {
    return Intl.message(
      'Write a note on 5 check-ins',
      name: 'achievementNoteWriterDesc',
      desc: '',
      args: [],
    );
  }

  /// `Friend to yourself`
  String get achievementSelfCareFriendTitle {
    return Intl.message(
      'Friend to yourself',
      name: 'achievementSelfCareFriendTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose “Need self-care” 3 times`
  String get achievementSelfCareFriendDesc {
    return Intl.message(
      'Choose “Need self-care” 3 times',
      name: 'achievementSelfCareFriendDesc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'th'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
