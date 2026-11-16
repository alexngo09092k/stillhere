// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "Best ${count}";

  static String m1(count) => "${count} days present";

  static String m2(unlocked, total) => "${unlocked}/${total} unlocked";

  static String m3(minutes) => "${minutes} min";

  static String m4(month, year) => "Month ${month}, ${year}";

  static String m5(error) => "Could not purchase: ${error}";

  static String m6(time) => "Remind at ${time} every day";

  static String m7(error) => "Restore failed: ${error}";

  static String m8(count) => "${count}-day streak";

  static String m9(count) => "${count} total";

  static String m10(version) => "Version ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutAiNote": MessageLookupByLibrary.simpleMessage(
            "AI greetings are optional. When AI is configured and enabled, a limited prompt is sent to generate a greeting; check-in notes and mood entries are never included. If AI is unavailable or not configured, the app uses local static greetings."),
        "aboutTitle": MessageLookupByLibrary.simpleMessage("About & Privacy"),
        "activityTagsPrompt":
            MessageLookupByLibrary.simpleMessage("Today was about… (optional)"),
        "adFreeExperience":
            MessageLookupByLibrary.simpleMessage("Ad-free experience"),
        "afternoon": MessageLookupByLibrary.simpleMessage("Afternoon"),
        "allowAiGreeting":
            MessageLookupByLibrary.simpleMessage("Allow AI greetings"),
        "appTagline":
            MessageLookupByLibrary.simpleMessage("A little space for you"),
        "backHome": MessageLookupByLibrary.simpleMessage("Back to home"),
        "benefitAiPriority":
            MessageLookupByLibrary.simpleMessage("Priority AI greetings"),
        "benefitExportJournal": MessageLookupByLibrary.simpleMessage(
            "Export your private journal anytime"),
        "benefitFullInsights": MessageLookupByLibrary.simpleMessage(
            "Full insights & longer history"),
        "benefitNoAds": MessageLookupByLibrary.simpleMessage(
            "No more banners & interstitials"),
        "benefitSupportDev": MessageLookupByLibrary.simpleMessage(
            "Support the development team"),
        "bestStreak": m0,
        "breathingGroundingSubtitle": MessageLookupByLibrary.simpleMessage(
            "Do these when you need to settle"),
        "breathingGroundingTitle":
            MessageLookupByLibrary.simpleMessage("Breathing & grounding"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "careSubtitle": MessageLookupByLibrary.simpleMessage(
            "Exercises, gentle ideas and your milestones"),
        "careTitle": MessageLookupByLibrary.simpleMessage("Care"),
        "careTodaysNote": MessageLookupByLibrary.simpleMessage("Today\'s note"),
        "checkInCta": MessageLookupByLibrary.simpleMessage("Check in today"),
        "checkInDeleted":
            MessageLookupByLibrary.simpleMessage("Check-in deleted."),
        "checkInTitle": MessageLookupByLibrary.simpleMessage("Check-in"),
        "checkInToday":
            MessageLookupByLibrary.simpleMessage("Today\'s check-in"),
        "chooseClosest": MessageLookupByLibrary.simpleMessage(
            "Pick what feels closest to you."),
        "continueAction": MessageLookupByLibrary.simpleMessage("Continue"),
        "dailyReminder": MessageLookupByLibrary.simpleMessage("Daily reminder"),
        "dataDeleted":
            MessageLookupByLibrary.simpleMessage("All data has been deleted."),
        "dataStaysOnDevice": MessageLookupByLibrary.simpleMessage(
            "Still Here • Data is stored locally"),
        "daysCheckedInPeriod": MessageLookupByLibrary.simpleMessage(
            "days checked in\nthis period"),
        "daysPresent": m1,
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteAllData":
            MessageLookupByLibrary.simpleMessage("Delete all data"),
        "deleteAllDataConfirm": MessageLookupByLibrary.simpleMessage(
            "Delete all data on this device? This cannot be undone."),
        "deleteCheckIn":
            MessageLookupByLibrary.simpleMessage("Delete check-in"),
        "deleteCheckInConfirm": MessageLookupByLibrary.simpleMessage(
            "Delete this day\'s check-in? This cannot be undone."),
        "doingGreat":
            MessageLookupByLibrary.simpleMessage("You\'re doing great 💚"),
        "downloadNow": MessageLookupByLibrary.simpleMessage("Download now"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "enableCheckInReminder":
            MessageLookupByLibrary.simpleMessage("Enable check-in reminder"),
        "enoughQuote":
            MessageLookupByLibrary.simpleMessage("\"This is already enough.\""),
        "evening": MessageLookupByLibrary.simpleMessage("Evening"),
        "exportData": MessageLookupByLibrary.simpleMessage("Export data"),
        "exportDataSubtitle": MessageLookupByLibrary.simpleMessage(
            "Share a JSON copy of your local check-ins"),
        "exportFailed":
            MessageLookupByLibrary.simpleMessage("Could not export data."),
        "failedToOpenBrowserPleaseTryAgain":
            MessageLookupByLibrary.simpleMessage(
                "Failed to open browser. Please try again."),
        "getStarted": MessageLookupByLibrary.simpleMessage("Get started"),
        "goBack": MessageLookupByLibrary.simpleMessage("Back"),
        "greetingFallback": MessageLookupByLibrary.simpleMessage(
            "Hello. Hope everything is going okay for you."),
        "headlineAfternoon":
            MessageLookupByLibrary.simpleMessage("The afternoon\nunfolds ✨"),
        "headlineEvening": MessageLookupByLibrary.simpleMessage(
            "Evening is here.\nYou are enough ✨"),
        "headlineMorning": MessageLookupByLibrary.simpleMessage(
            "A new morning\nis beginning ✨"),
        "headlineNoon":
            MessageLookupByLibrary.simpleMessage("The middle of\nthe day ✨"),
        "helloAfternoon":
            MessageLookupByLibrary.simpleMessage("Good afternoon,"),
        "helloEvening": MessageLookupByLibrary.simpleMessage("Good evening,"),
        "helloMorning": MessageLookupByLibrary.simpleMessage("Good morning,"),
        "historyEmpty": MessageLookupByLibrary.simpleMessage(
            "No entries this month yet.\nYou can start whenever you\'re ready."),
        "historyTitle": MessageLookupByLibrary.simpleMessage("Journal"),
        "howAreYouFeeling":
            MessageLookupByLibrary.simpleMessage("How are you feeling today?"),
        "howAreYouFeelingTitle":
            MessageLookupByLibrary.simpleMessage("How are you\nfeeling today?"),
        "howAreYouFeelingToday":
            MessageLookupByLibrary.simpleMessage("How are you feeling today?"),
        "iapUnavailable": MessageLookupByLibrary.simpleMessage(
            "In-app purchases are temporarily unavailable."),
        "journalSubtitle": MessageLookupByLibrary.simpleMessage(
            "Your days, your real feelings."),
        "labelDays": MessageLookupByLibrary.simpleMessage("Days"),
        "labelOk": MessageLookupByLibrary.simpleMessage("Okay"),
        "labelSelfCare": MessageLookupByLibrary.simpleMessage("Self-care"),
        "labelShare": MessageLookupByLibrary.simpleMessage("Share"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "later": MessageLookupByLibrary.simpleMessage("Later"),
        "legalLinks": MessageLookupByLibrary.simpleMessage("Legal"),
        "loadingPlans": MessageLookupByLibrary.simpleMessage("Loading plans…"),
        "lookBackJourney":
            MessageLookupByLibrary.simpleMessage("Look back on your journey"),
        "looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd":
            MessageLookupByLibrary.simpleMessage(
                "Looks like your connection is interrupted. Check your network connection and try again."),
        "milestonesTitle": MessageLookupByLibrary.simpleMessage("Milestones"),
        "milestonesUnlocked": m2,
        "minutesLabel": m3,
        "monthLabel": m4,
        "moodDistribution":
            MessageLookupByLibrary.simpleMessage("Mood distribution"),
        "morning": MessageLookupByLibrary.simpleMessage("Morning"),
        "navCare": MessageLookupByLibrary.simpleMessage("Care"),
        "navHistory": MessageLookupByLibrary.simpleMessage("Journal"),
        "navHome": MessageLookupByLibrary.simpleMessage("Home"),
        "navJournal": MessageLookupByLibrary.simpleMessage("Journal"),
        "navSettings": MessageLookupByLibrary.simpleMessage("Settings"),
        "navStats": MessageLookupByLibrary.simpleMessage("Insights"),
        "needNotificationPermission": MessageLookupByLibrary.simpleMessage(
            "Notification permission is needed for reminders. You can enable it in system Settings."),
        "noRightOrWrong": MessageLookupByLibrary.simpleMessage(
            "There is no right or wrong answer.\nChoose what feels closest to you."),
        "noteHint": MessageLookupByLibrary.simpleMessage(
            "Anything you\'d like to note today?"),
        "noteHintPersonal":
            MessageLookupByLibrary.simpleMessage("A few lines for yourself…"),
        "noteOptional": MessageLookupByLibrary.simpleMessage("Note (optional)"),
        "noteTooLong": MessageLookupByLibrary.simpleMessage(
            "Note is too long (max 500 characters)."),
        "onboard1Body": MessageLookupByLibrary.simpleMessage(
            "You don\'t always have to be fine. You can share in your own way."),
        "onboard1Title":
            MessageLookupByLibrary.simpleMessage("A small pause each day"),
        "onboard2Body": MessageLookupByLibrary.simpleMessage(
            "A gentle hello and a place to note how you feel — just for you."),
        "onboard2Title":
            MessageLookupByLibrary.simpleMessage("Private greeting & check-in"),
        "onboard3Body": MessageLookupByLibrary.simpleMessage(
            "No account, no required cloud. You\'re fully in control."),
        "onboard3Title": MessageLookupByLibrary.simpleMessage(
            "Your data stays on your device"),
        "openBrowser": MessageLookupByLibrary.simpleMessage("Open in browser"),
        "openSettings": MessageLookupByLibrary.simpleMessage("Open Settings"),
        "premium": MessageLookupByLibrary.simpleMessage("Premium"),
        "premiumActive": MessageLookupByLibrary.simpleMessage("Active"),
        "premiumActiveOnDevice": MessageLookupByLibrary.simpleMessage(
            "Premium is active on this device."),
        "premiumSupportDesc": MessageLookupByLibrary.simpleMessage(
            "Remove all ads and support StillHere development."),
        "premiumThanks": MessageLookupByLibrary.simpleMessage(
            "Thanks for supporting StillHere. Ads have been removed."),
        "presenceRate": MessageLookupByLibrary.simpleMessage("Presence rate"),
        "privacy": MessageLookupByLibrary.simpleMessage("Privacy"),
        "privacyBody": MessageLookupByLibrary.simpleMessage(
            "Check-ins and notes are stored locally in the app. Still Here does not require an account. We do not send your notes or mood status to analytics. Depending on your operating-system backup settings, app data may be included in device backups. You can export or delete data in Settings."),
        "promptGeneral1": MessageLookupByLibrary.simpleMessage(
            "What felt a little softer today?"),
        "promptGeneral2": MessageLookupByLibrary.simpleMessage(
            "Is there one thing you handled kindly?"),
        "promptGeneral3": MessageLookupByLibrary.simpleMessage(
            "What do you want to leave behind for tonight?"),
        "promptGeneral4": MessageLookupByLibrary.simpleMessage(
            "Who or what made you feel less alone?"),
        "promptGeneral5": MessageLookupByLibrary.simpleMessage(
            "What would “enough” look like right now?"),
        "promptOk1": MessageLookupByLibrary.simpleMessage(
            "What is supporting this calm?"),
        "promptOk2": MessageLookupByLibrary.simpleMessage(
            "Name one small win you almost overlooked."),
        "promptOk3": MessageLookupByLibrary.simpleMessage(
            "How can you protect this energy tomorrow?"),
        "promptSelfCare1": MessageLookupByLibrary.simpleMessage(
            "What would feel caring in the next hour?"),
        "promptSelfCare2": MessageLookupByLibrary.simpleMessage(
            "Where can you ask for less of yourself today?"),
        "promptSelfCare3": MessageLookupByLibrary.simpleMessage(
            "What boundary would help you rest?"),
        "promptShare1": MessageLookupByLibrary.simpleMessage(
            "What would you say if a friend felt this way?"),
        "promptShare2": MessageLookupByLibrary.simpleMessage(
            "Which part of today needs a little more room?"),
        "promptShare3": MessageLookupByLibrary.simpleMessage(
            "What emotion is asking to be named?"),
        "purchaseFailed": m5,
        "purchaseIncomplete": MessageLookupByLibrary.simpleMessage(
            "Purchase not completed. Try again or restore purchases."),
        "purchaseSuccess": MessageLookupByLibrary.simpleMessage(
            "Premium unlocked. Thank you!"),
        "recentEntries": MessageLookupByLibrary.simpleMessage("Recent entries"),
        "reminderAt": m6,
        "reminderNotificationBody": MessageLookupByLibrary.simpleMessage(
            "A small hello is waiting for you."),
        "reminderNotificationTitle":
            MessageLookupByLibrary.simpleMessage("Still Here"),
        "reminderOff": MessageLookupByLibrary.simpleMessage("Off"),
        "reminderTime": MessageLookupByLibrary.simpleMessage("Reminder time"),
        "removeAdsPremium":
            MessageLookupByLibrary.simpleMessage("Remove ads / Premium"),
        "restoreEmpty": MessageLookupByLibrary.simpleMessage(
            "No previous purchases found."),
        "restoreFailed": m7,
        "restorePurchases":
            MessageLookupByLibrary.simpleMessage("Restore purchases"),
        "restoreSuccess": MessageLookupByLibrary.simpleMessage(
            "Premium restored successfully."),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "saveFailed": MessageLookupByLibrary.simpleMessage(
            "Couldn\'t save. Please try again."),
        "saveForMyself":
            MessageLookupByLibrary.simpleMessage("Save for myself"),
        "sectionAbout": MessageLookupByLibrary.simpleMessage("About"),
        "sectionData": MessageLookupByLibrary.simpleMessage("Data"),
        "sectionGreeting": MessageLookupByLibrary.simpleMessage("Greeting"),
        "sectionPremium": MessageLookupByLibrary.simpleMessage("Premium"),
        "sectionReminder": MessageLookupByLibrary.simpleMessage("Reminders"),
        "segmentMonth": MessageLookupByLibrary.simpleMessage("Month"),
        "segmentWeek": MessageLookupByLibrary.simpleMessage("Week"),
        "segmentYear": MessageLookupByLibrary.simpleMessage("Year"),
        "selfCareMessage": MessageLookupByLibrary.simpleMessage(
            "You are taking care of yourself beautifully"),
        "settingsSubtitle": MessageLookupByLibrary.simpleMessage(
            "A little corner of your own."),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "splashTagline":
            MessageLookupByLibrary.simpleMessage("A little space for you"),
        "statusOk": MessageLookupByLibrary.simpleMessage("Okay"),
        "statusOkSubtitle":
            MessageLookupByLibrary.simpleMessage("And that is enough."),
        "statusOkTitle": MessageLookupByLibrary.simpleMessage("I\'m okay."),
        "statusSelfCare":
            MessageLookupByLibrary.simpleMessage("Need self-care"),
        "statusSelfCareSubtitle":
            MessageLookupByLibrary.simpleMessage("Gentle space for yourself."),
        "statusSelfCareTitle": MessageLookupByLibrary.simpleMessage(
            "I need a bit more care today."),
        "statusShare": MessageLookupByLibrary.simpleMessage("Want to share"),
        "statusShareSubtitle": MessageLookupByLibrary.simpleMessage(
            "Something to say to yourself."),
        "statusShareTitle":
            MessageLookupByLibrary.simpleMessage("I want to share a little."),
        "streakDays": m8,
        "suggestionsForTodaySubtitle": MessageLookupByLibrary.simpleMessage(
            "Based on how you have been feeling"),
        "suggestionsForTodayTitle":
            MessageLookupByLibrary.simpleMessage("Suggestions for today"),
        "tagFamily": MessageLookupByLibrary.simpleMessage("Family"),
        "tagFood": MessageLookupByLibrary.simpleMessage("Food"),
        "tagFriends": MessageLookupByLibrary.simpleMessage("Friends"),
        "tagHealth": MessageLookupByLibrary.simpleMessage("Health"),
        "tagHobby": MessageLookupByLibrary.simpleMessage("Hobby"),
        "tagOther": MessageLookupByLibrary.simpleMessage("Other"),
        "tagOutdoor": MessageLookupByLibrary.simpleMessage("Outdoor"),
        "tagRest": MessageLookupByLibrary.simpleMessage("Rest"),
        "tagStudy": MessageLookupByLibrary.simpleMessage("Study"),
        "tagWork": MessageLookupByLibrary.simpleMessage("Work"),
        "thankYouCheckIn": MessageLookupByLibrary.simpleMessage(
            "Thank you for taking\na moment for yourself."),
        "thankYouForBeingHere":
            MessageLookupByLibrary.simpleMessage("Thank you\nfor being here."),
        "thankYouMoment": MessageLookupByLibrary.simpleMessage(
            "Thank you for taking a moment\nfor yourself."),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "themeDark": MessageLookupByLibrary.simpleMessage("Dark"),
        "themeLight": MessageLookupByLibrary.simpleMessage("Light"),
        "themeSystem": MessageLookupByLibrary.simpleMessage("System"),
        "tipAfterOk": MessageLookupByLibrary.simpleMessage(
            "Notice one thing that is okay enough right now. Let it be enough for this moment."),
        "tipAfterSelfCare": MessageLookupByLibrary.simpleMessage(
            "A soft idea: place a hand on your chest and take three slow breaths. You do not have to fix everything today."),
        "tipAfterShare": MessageLookupByLibrary.simpleMessage(
            "Whatever you are carrying is allowed here. You showed up — that already counts."),
        "today": MessageLookupByLibrary.simpleMessage("Today"),
        "todaysNote": MessageLookupByLibrary.simpleMessage("Today\'s note"),
        "totalDaysShort": m9,
        "update": MessageLookupByLibrary.simpleMessage("Update"),
        "upgradePremium":
            MessageLookupByLibrary.simpleMessage("Upgrade to Premium"),
        "upgradeToRemoveAds":
            MessageLookupByLibrary.simpleMessage("Upgrade to remove ads"),
        "useAiGreeting":
            MessageLookupByLibrary.simpleMessage("Use AI greetings"),
        "useAiGreetingSubtitle": MessageLookupByLibrary.simpleMessage(
            "Turn off to always use local greetings"),
        "versionLabel": m10,
        "viewHistory":
            MessageLookupByLibrary.simpleMessage("View your journey"),
        "viewJourney":
            MessageLookupByLibrary.simpleMessage("View your journey"),
        "writeMorePrompt": MessageLookupByLibrary.simpleMessage(
            "Would you like to write a little more?"),
        "youAreCurrentlyOffline":
            MessageLookupByLibrary.simpleMessage("You\'re currently offline"),
        "youArePremium":
            MessageLookupByLibrary.simpleMessage("You\'re on Premium"),
        "yourAppIsOutdated": MessageLookupByLibrary.simpleMessage(
            "Your app is outdated. Please update to continue."),
        "yourAppVersionIsNoLongerSupportedYoureMissingOut":
            MessageLookupByLibrary.simpleMessage(
                "Your app version is no longer supported. You\'re missing out on new features and improvements."),
        "yourJournal": MessageLookupByLibrary.simpleMessage("Your journal"),
        "youreEnough": MessageLookupByLibrary.simpleMessage("You\'re enough ♡")
      };
}
