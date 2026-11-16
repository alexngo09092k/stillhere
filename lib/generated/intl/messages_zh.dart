// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  static String m0(count) => "最长 ${count}";

  static String m1(count) => "已记录 ${count} 天";

  static String m2(unlocked, total) => "已解锁 ${unlocked}/${total}";

  static String m3(minutes) => "${minutes} 分钟";

  static String m4(month, year) => "${year}年${month}月";

  static String m5(error) => "无法购买：${error}";

  static String m6(time) => "每天 ${time} 提醒";

  static String m7(error) => "恢复失败：${error}";

  static String m8(count) => "连续 ${count} 天";

  static String m9(count) => "共 ${count}";

  static String m10(version) => "版本 ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutAiNote": MessageLookupByLibrary.simpleMessage(
            "AI 问候为可选功能。配置并启用 AI 后，应用只会发送有限的提示内容来生成问候，不会包含签到备注或情绪状态。如果 AI 尚未配置或不可用，应用会使用本地静态问候语。"),
        "aboutTitle": MessageLookupByLibrary.simpleMessage("关于与隐私"),
        "achievementFirstCheckinDesc":
            MessageLookupByLibrary.simpleMessage("完成第一次签到"),
        "achievementFirstCheckinTitle":
            MessageLookupByLibrary.simpleMessage("旅程开始"),
        "achievementNoteWriterDesc":
            MessageLookupByLibrary.simpleMessage("在5次签到中写下笔记"),
        "achievementNoteWriterTitle":
            MessageLookupByLibrary.simpleMessage("书写者"),
        "achievementSelfCareFriendDesc":
            MessageLookupByLibrary.simpleMessage("选择“需要自我照顾”3次"),
        "achievementSelfCareFriendTitle":
            MessageLookupByLibrary.simpleMessage("自己的朋友"),
        "achievementStreak14Desc":
            MessageLookupByLibrary.simpleMessage("连续签到14天"),
        "achievementStreak14Title":
            MessageLookupByLibrary.simpleMessage("两周的陪伴"),
        "achievementStreak30Desc":
            MessageLookupByLibrary.simpleMessage("连续签到30天"),
        "achievementStreak30Title":
            MessageLookupByLibrary.simpleMessage("在这里一个月"),
        "achievementStreak3Desc":
            MessageLookupByLibrary.simpleMessage("连续签到3天"),
        "achievementStreak3Title": MessageLookupByLibrary.simpleMessage("连续3天"),
        "achievementStreak7Desc":
            MessageLookupByLibrary.simpleMessage("连续签到7天"),
        "achievementStreak7Title":
            MessageLookupByLibrary.simpleMessage("温柔的一周"),
        "achievementTotal100Desc":
            MessageLookupByLibrary.simpleMessage("累计签到100天"),
        "achievementTotal100Title":
            MessageLookupByLibrary.simpleMessage("100天仍在这里"),
        "achievementTotal10Desc":
            MessageLookupByLibrary.simpleMessage("累计签到10天"),
        "achievementTotal10Title":
            MessageLookupByLibrary.simpleMessage("10次倾听"),
        "achievementTotal30Desc":
            MessageLookupByLibrary.simpleMessage("累计签到30天"),
        "achievementTotal30Title":
            MessageLookupByLibrary.simpleMessage("30天的关怀"),
        "activityTagsPrompt":
            MessageLookupByLibrary.simpleMessage("今天与…有关（可选）"),
        "adFreeExperience": MessageLookupByLibrary.simpleMessage("无广告体验"),
        "afternoon": MessageLookupByLibrary.simpleMessage("下午"),
        "allowAiGreeting": MessageLookupByLibrary.simpleMessage("允许 AI 问候"),
        "appTagline": MessageLookupByLibrary.simpleMessage("为你留出的一小片空间"),
        "backHome": MessageLookupByLibrary.simpleMessage("返回首页"),
        "benefitAiPriority": MessageLookupByLibrary.simpleMessage("优先 AI 问候"),
        "benefitExportJournal":
            MessageLookupByLibrary.simpleMessage("随时导出你的私密日记"),
        "benefitFullInsights":
            MessageLookupByLibrary.simpleMessage("完整洞察与更长历史"),
        "benefitNoAds": MessageLookupByLibrary.simpleMessage("不再显示横幅与插屏广告"),
        "benefitSupportDev": MessageLookupByLibrary.simpleMessage("支持开发团队"),
        "bestStreak": m0,
        "breathingGroundingSubtitle":
            MessageLookupByLibrary.simpleMessage("需要平静时做这些"),
        "breathingGroundingTitle":
            MessageLookupByLibrary.simpleMessage("呼吸与接地练习"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "careSubtitle": MessageLookupByLibrary.simpleMessage("练习、温柔的想法与你的里程碑"),
        "careTitle": MessageLookupByLibrary.simpleMessage("关怀"),
        "careTodaysNote": MessageLookupByLibrary.simpleMessage("今日提醒"),
        "checkInCta": MessageLookupByLibrary.simpleMessage("今日打卡"),
        "checkInDeleted": MessageLookupByLibrary.simpleMessage("已删除打卡。"),
        "checkInTitle": MessageLookupByLibrary.simpleMessage("打卡"),
        "checkInToday": MessageLookupByLibrary.simpleMessage("今日打卡"),
        "chooseClosest": MessageLookupByLibrary.simpleMessage("选择最接近你此刻的状态。"),
        "continueAction": MessageLookupByLibrary.simpleMessage("继续"),
        "dailyReminder": MessageLookupByLibrary.simpleMessage("每日提醒"),
        "dataDeleted": MessageLookupByLibrary.simpleMessage("已删除全部数据。"),
        "dataStaysOnDevice":
            MessageLookupByLibrary.simpleMessage("Still Here • 数据在应用内本地保存"),
        "daysCheckedInPeriod":
            MessageLookupByLibrary.simpleMessage("本周期已打卡\n天数"),
        "daysPresent": m1,
        "delete": MessageLookupByLibrary.simpleMessage("删除"),
        "deleteAllData": MessageLookupByLibrary.simpleMessage("删除全部数据"),
        "deleteAllDataConfirm":
            MessageLookupByLibrary.simpleMessage("删除此设备上的全部数据？此操作无法撤销。"),
        "deleteCheckIn": MessageLookupByLibrary.simpleMessage("删除打卡"),
        "deleteCheckInConfirm":
            MessageLookupByLibrary.simpleMessage("删除这一天的打卡？此操作无法撤销。"),
        "doingGreat": MessageLookupByLibrary.simpleMessage("你做得很好 💚"),
        "downloadNow": MessageLookupByLibrary.simpleMessage("立即下载"),
        "edit": MessageLookupByLibrary.simpleMessage("编辑"),
        "enableCheckInReminder": MessageLookupByLibrary.simpleMessage("开启打卡提醒"),
        "enoughQuote": MessageLookupByLibrary.simpleMessage("“这样就够了。”"),
        "evening": MessageLookupByLibrary.simpleMessage("晚上"),
        "exportData": MessageLookupByLibrary.simpleMessage("导出数据"),
        "exportDataSubtitle":
            MessageLookupByLibrary.simpleMessage("分享本地打卡记录的 JSON 副本"),
        "exportFailed": MessageLookupByLibrary.simpleMessage("无法导出数据。"),
        "failedToOpenBrowserPleaseTryAgain":
            MessageLookupByLibrary.simpleMessage("无法打开浏览器，请重试。"),
        "getStarted": MessageLookupByLibrary.simpleMessage("开始"),
        "goBack": MessageLookupByLibrary.simpleMessage("返回"),
        "greetingFallback": MessageLookupByLibrary.simpleMessage("你好。希望你一切都好。"),
        "headlineAfternoon":
            MessageLookupByLibrary.simpleMessage("傍晚将至\n放慢脚步 ✨"),
        "headlineEvening": MessageLookupByLibrary.simpleMessage("夜晚安静\n你在这里 ✨"),
        "headlineMorning": MessageLookupByLibrary.simpleMessage("新的早晨\n正在开始 ✨"),
        "headlineNoon": MessageLookupByLibrary.simpleMessage("午后时光\n慢慢来 ✨"),
        "helloAfternoon": MessageLookupByLibrary.simpleMessage("下午好，"),
        "helloEvening": MessageLookupByLibrary.simpleMessage("晚上好，"),
        "helloMorning": MessageLookupByLibrary.simpleMessage("早上好，"),
        "historyEmpty":
            MessageLookupByLibrary.simpleMessage("本月还没有记录。\n随时可以开始。"),
        "historyTitle": MessageLookupByLibrary.simpleMessage("日记"),
        "howAreYouFeeling": MessageLookupByLibrary.simpleMessage("今天感觉怎么样？"),
        "howAreYouFeelingTitle":
            MessageLookupByLibrary.simpleMessage("今天，\n你感觉如何？"),
        "howAreYouFeelingToday":
            MessageLookupByLibrary.simpleMessage("今天感觉怎么样？"),
        "iapUnavailable": MessageLookupByLibrary.simpleMessage("应用内购买暂时不可用。"),
        "journalSubtitle": MessageLookupByLibrary.simpleMessage("你的日子，真实的感受。"),
        "labelDays": MessageLookupByLibrary.simpleMessage("天数"),
        "labelOk": MessageLookupByLibrary.simpleMessage("还好"),
        "labelSelfCare": MessageLookupByLibrary.simpleMessage("自我关照"),
        "labelShare": MessageLookupByLibrary.simpleMessage("分享"),
        "language": MessageLookupByLibrary.simpleMessage("语言"),
        "later": MessageLookupByLibrary.simpleMessage("稍后再说"),
        "legalLinks": MessageLookupByLibrary.simpleMessage("法律信息"),
        "loadingPlans": MessageLookupByLibrary.simpleMessage("正在加载套餐…"),
        "lookBackJourney": MessageLookupByLibrary.simpleMessage("回顾旅程"),
        "looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd":
            MessageLookupByLibrary.simpleMessage("看起来您的网络连接已中断。请检查网络后重试。"),
        "milestonesTitle": MessageLookupByLibrary.simpleMessage("里程碑"),
        "milestonesUnlocked": m2,
        "minutesLabel": m3,
        "monthLabel": m4,
        "moodDistribution": MessageLookupByLibrary.simpleMessage("情绪分布"),
        "morning": MessageLookupByLibrary.simpleMessage("早上"),
        "navCare": MessageLookupByLibrary.simpleMessage("关怀"),
        "navHistory": MessageLookupByLibrary.simpleMessage("日记"),
        "navHome": MessageLookupByLibrary.simpleMessage("首页"),
        "navJournal": MessageLookupByLibrary.simpleMessage("日记"),
        "navSettings": MessageLookupByLibrary.simpleMessage("设置"),
        "navStats": MessageLookupByLibrary.simpleMessage("统计"),
        "needNotificationPermission":
            MessageLookupByLibrary.simpleMessage("需要通知权限才能提醒你。可在系统设置中开启。"),
        "noRightOrWrong":
            MessageLookupByLibrary.simpleMessage("没有对错之分。\n选择最贴近你的那一个。"),
        "noteHint": MessageLookupByLibrary.simpleMessage("今天想记下什么吗？"),
        "noteHintPersonal": MessageLookupByLibrary.simpleMessage("给自己写几句话…"),
        "noteOptional": MessageLookupByLibrary.simpleMessage("备注（可选）"),
        "noteTooLong": MessageLookupByLibrary.simpleMessage("备注过长（最多 500 字）。"),
        "onboard1Body":
            MessageLookupByLibrary.simpleMessage("不必总是很好。你可以按自己的方式分享。"),
        "onboard1Title": MessageLookupByLibrary.simpleMessage("每天一个小小停顿"),
        "onboard2Body":
            MessageLookupByLibrary.simpleMessage("一句温柔的问候，和一个只属于你的情绪记录处。"),
        "onboard2Title": MessageLookupByLibrary.simpleMessage("私密问候与打卡"),
        "onboard3Body":
            MessageLookupByLibrary.simpleMessage("无需账号，无需强制云端。完全由你掌控。"),
        "onboard3Title": MessageLookupByLibrary.simpleMessage("数据保存在你的设备上"),
        "openBrowser": MessageLookupByLibrary.simpleMessage("在浏览器中打开"),
        "openSettings": MessageLookupByLibrary.simpleMessage("打开设置"),
        "premium": MessageLookupByLibrary.simpleMessage("高级版"),
        "premiumActive": MessageLookupByLibrary.simpleMessage("已开通"),
        "premiumActiveOnDevice":
            MessageLookupByLibrary.simpleMessage("本设备已开通高级版。"),
        "premiumSupportDesc":
            MessageLookupByLibrary.simpleMessage("去除全部广告并支持 StillHere 开发。"),
        "premiumThanks":
            MessageLookupByLibrary.simpleMessage("感谢支持 StillHere。广告已去除。"),
        "presenceRate": MessageLookupByLibrary.simpleMessage("到场率"),
        "privacy": MessageLookupByLibrary.simpleMessage("隐私"),
        "privacyBody": MessageLookupByLibrary.simpleMessage(
            "签到和备注保存在应用本地。Still Here 无需账户。我们不会将你的备注或情绪状态发送到分析系统。根据操作系统的备份设置，应用数据可能会包含在设备备份中。你可以在设置中导出或删除数据。"),
        "promptGeneral1": MessageLookupByLibrary.simpleMessage("今天有什么稍微柔软了一些？"),
        "promptGeneral2":
            MessageLookupByLibrary.simpleMessage("有没有一件事你对自己温柔以待？"),
        "promptGeneral3": MessageLookupByLibrary.simpleMessage("今晚你想放下什么？"),
        "promptGeneral4": MessageLookupByLibrary.simpleMessage("谁或什么让你少一点孤单？"),
        "promptGeneral5":
            MessageLookupByLibrary.simpleMessage("此刻的“足够”会是什么样子？"),
        "promptOk1": MessageLookupByLibrary.simpleMessage("是什么在支撑这份平静？"),
        "promptOk2": MessageLookupByLibrary.simpleMessage("说出一个你差点忽略的小胜利。"),
        "promptOk3": MessageLookupByLibrary.simpleMessage("明天可以怎样守护这份能量？"),
        "promptSelfCare1":
            MessageLookupByLibrary.simpleMessage("接下来一小时，什么会让你感到被照顾？"),
        "promptSelfCare2":
            MessageLookupByLibrary.simpleMessage("今天哪里可以对自己要求少一点？"),
        "promptSelfCare3": MessageLookupByLibrary.simpleMessage("怎样的边界能帮你休息？"),
        "promptShare1":
            MessageLookupByLibrary.simpleMessage("如果朋友有这种感受，你会说什么？"),
        "promptShare2": MessageLookupByLibrary.simpleMessage("今天的哪一部分需要多一点空间？"),
        "promptShare3": MessageLookupByLibrary.simpleMessage("哪种情绪想被命名？"),
        "purchaseFailed": m5,
        "purchaseIncomplete":
            MessageLookupByLibrary.simpleMessage("购买未完成。请重试或恢复购买。"),
        "purchaseSuccess": MessageLookupByLibrary.simpleMessage("已升级高级版。谢谢你！"),
        "recentEntries": MessageLookupByLibrary.simpleMessage("最近记录"),
        "reminderAt": m6,
        "reminderNotificationBody":
            MessageLookupByLibrary.simpleMessage("一句小小的问候在等着你。"),
        "reminderNotificationTitle":
            MessageLookupByLibrary.simpleMessage("Still Here"),
        "reminderOff": MessageLookupByLibrary.simpleMessage("关闭"),
        "reminderTime": MessageLookupByLibrary.simpleMessage("提醒时间"),
        "removeAdsPremium": MessageLookupByLibrary.simpleMessage("去除广告 / 高级版"),
        "restoreEmpty": MessageLookupByLibrary.simpleMessage("未找到之前的购买记录。"),
        "restoreFailed": m7,
        "restorePurchases": MessageLookupByLibrary.simpleMessage("恢复购买"),
        "restoreSuccess": MessageLookupByLibrary.simpleMessage("已成功恢复高级版。"),
        "retry": MessageLookupByLibrary.simpleMessage("重试"),
        "save": MessageLookupByLibrary.simpleMessage("保存"),
        "saveFailed": MessageLookupByLibrary.simpleMessage("保存失败，请再试一次。"),
        "saveForMyself": MessageLookupByLibrary.simpleMessage("为自己保存"),
        "sectionAbout": MessageLookupByLibrary.simpleMessage("关于"),
        "sectionData": MessageLookupByLibrary.simpleMessage("数据"),
        "sectionGreeting": MessageLookupByLibrary.simpleMessage("问候"),
        "sectionPremium": MessageLookupByLibrary.simpleMessage("高级版"),
        "sectionReminder": MessageLookupByLibrary.simpleMessage("提醒"),
        "segmentMonth": MessageLookupByLibrary.simpleMessage("月"),
        "segmentWeek": MessageLookupByLibrary.simpleMessage("周"),
        "segmentYear": MessageLookupByLibrary.simpleMessage("年"),
        "selfCareMessage": MessageLookupByLibrary.simpleMessage("你在好好照顾自己"),
        "settingsSubtitle": MessageLookupByLibrary.simpleMessage("属于你的小小角落。"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("设置"),
        "skip": MessageLookupByLibrary.simpleMessage("跳过"),
        "splashTagline": MessageLookupByLibrary.simpleMessage("为你留出的一小片空间"),
        "statusOk": MessageLookupByLibrary.simpleMessage("还好"),
        "statusOkSubtitle": MessageLookupByLibrary.simpleMessage("这样就够了。"),
        "statusOkTitle": MessageLookupByLibrary.simpleMessage("我还好。"),
        "statusSelfCare": MessageLookupByLibrary.simpleMessage("需要自我关照"),
        "statusSelfCareSubtitle":
            MessageLookupByLibrary.simpleMessage("给自己一点温柔空间。"),
        "statusSelfCareTitle":
            MessageLookupByLibrary.simpleMessage("今天更需要照顾自己。"),
        "statusShare": MessageLookupByLibrary.simpleMessage("想分享"),
        "statusShareSubtitle": MessageLookupByLibrary.simpleMessage("有话想对自己说。"),
        "statusShareTitle": MessageLookupByLibrary.simpleMessage("想稍微分享一下。"),
        "streakDays": m8,
        "suggestionsForTodaySubtitle":
            MessageLookupByLibrary.simpleMessage("基于你最近的感受"),
        "suggestionsForTodayTitle":
            MessageLookupByLibrary.simpleMessage("今日建议"),
        "tagFamily": MessageLookupByLibrary.simpleMessage("家庭"),
        "tagFood": MessageLookupByLibrary.simpleMessage("饮食"),
        "tagFriends": MessageLookupByLibrary.simpleMessage("朋友"),
        "tagHealth": MessageLookupByLibrary.simpleMessage("健康"),
        "tagHobby": MessageLookupByLibrary.simpleMessage("爱好"),
        "tagOther": MessageLookupByLibrary.simpleMessage("其他"),
        "tagOutdoor": MessageLookupByLibrary.simpleMessage("户外"),
        "tagRest": MessageLookupByLibrary.simpleMessage("休息"),
        "tagStudy": MessageLookupByLibrary.simpleMessage("学习"),
        "tagWork": MessageLookupByLibrary.simpleMessage("工作"),
        "thankYouCheckIn":
            MessageLookupByLibrary.simpleMessage("谢谢你为自己\n留出一点时间。"),
        "thankYouForBeingHere":
            MessageLookupByLibrary.simpleMessage("谢谢你\n在这里。"),
        "thankYouMoment":
            MessageLookupByLibrary.simpleMessage("谢谢你为自己\n留出一点时间。"),
        "theme": MessageLookupByLibrary.simpleMessage("主题"),
        "themeDark": MessageLookupByLibrary.simpleMessage("深色"),
        "themeLight": MessageLookupByLibrary.simpleMessage("浅色"),
        "themeSystem": MessageLookupByLibrary.simpleMessage("跟随系统"),
        "tipAfterOk":
            MessageLookupByLibrary.simpleMessage("留意此刻一件已经足够好的小事。就让它成为这一刻的足够。"),
        "tipAfterSelfCare":
            MessageLookupByLibrary.simpleMessage("轻轻把手放在胸口，慢慢呼吸三次。今天不必修好每一件事。"),
        "tipAfterShare": MessageLookupByLibrary.simpleMessage(
            "你此刻承载的一切在这里都被允许。你出现了——这就已经算数。"),
        "today": MessageLookupByLibrary.simpleMessage("今天"),
        "todaysNote": MessageLookupByLibrary.simpleMessage("今日寄语"),
        "totalDaysShort": m9,
        "update": MessageLookupByLibrary.simpleMessage("更新"),
        "upgradePremium": MessageLookupByLibrary.simpleMessage("升级高级版"),
        "upgradeToRemoveAds": MessageLookupByLibrary.simpleMessage("升级以去除广告"),
        "useAiGreeting": MessageLookupByLibrary.simpleMessage("使用 AI 问候"),
        "useAiGreetingSubtitle":
            MessageLookupByLibrary.simpleMessage("关闭后始终使用本地问候"),
        "versionLabel": m10,
        "viewHistory": MessageLookupByLibrary.simpleMessage("查看你的旅程"),
        "viewJourney": MessageLookupByLibrary.simpleMessage("查看你的旅程"),
        "writeMorePrompt": MessageLookupByLibrary.simpleMessage("还想再写一点吗？"),
        "youAreCurrentlyOffline":
            MessageLookupByLibrary.simpleMessage("您当前处于离线状态"),
        "youArePremium": MessageLookupByLibrary.simpleMessage("你正在使用高级版"),
        "yourAppIsOutdated":
            MessageLookupByLibrary.simpleMessage("应用版本过旧，请更新后继续使用。"),
        "yourAppVersionIsNoLongerSupportedYoureMissingOut":
            MessageLookupByLibrary.simpleMessage("您的应用版本已不再受支持。您正在错过新功能和改进。"),
        "yourJournal": MessageLookupByLibrary.simpleMessage("你的日记"),
        "youreEnough": MessageLookupByLibrary.simpleMessage("You\'re enough ♡")
      };
}
