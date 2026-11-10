const enviroment = {
  //! ====================================== REMOTE CONFIG ==============================================
  "remoteConfig": {
    "enable": true,
    "providers": ["huawei"],
    'fetchTimeout': 60000, // 1 minutes
    'minimumFetchInterval': 3600000, // 1 hour in prod
  },

  //! ====================================== BUSSINESS ==============================================
  "business": {
    /// App mode
    /// production, debug, maintenance
    'appMode': 'production',

    /// Maintenance mode
    'maintenanceMode': {
      'title': "We'll be back soon",
      'message':
          "We're very sorry for the inconvenience but we're performing maintaince. Please check back soon ...",
      'link': 'https://still_here.netlify.app',
    },

    /// Display name is used in app
    'appName': 'Still Here',

    /// Version
    'version': '1.0.0',

    /// Logo is used in splash screen and app ui
    'appLogo': 'assets/images/logo.png',

    'appBio': 'Một lời hỏi thăm nhỏ mỗi ngày',

    /// Protocols is use to check
    'protocols': ['https://', 'http://', 'data:'],

    /// Prefix stored key
    'prefix': 'app.still_here.studio.',

    /// Contact
    'contact': 'anh.nh182113@gmail.com',

    /// Social Networks
    'socialNetworks': [
      {
        'brand': 'Facebook',
        'link': 'https://www.facebook.com/still_here/',
        'image':
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/600px-Facebook_Logo_%282019%29.png',
      },
      {
        'brand': 'Tiktok',
        'link': 'https://www.tiktok.com/@still_here',
        'image':
            'https://cdn4.iconfinder.com/data/icons/social-media-flat-7/64/Social-media_Tiktok-512.png',
      },
      {
        'brand': 'Youtube',
        'link': 'https://www.youtube.com/@still_here',
        'image':
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/318px-YouTube_full-color_icon_%282017%29.svg.png',
      },
      {
        'brand': 'Telegram',
        'link': 'https://t.me/+GPyDosamyKA2OGVl',
        'image':
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Telegram_logo.svg/512px-Telegram_logo.svg.png?20220101141644',
      },
    ],

    /// Web links
    'webLinks': [
      {
        'title': 'Terms of service',
        'link': 'https://still_here.netlify.app/terms-of-service',
        'image': 'assets/images/icons/ic_term.png',
      },
      {
        'title': 'Privacy policy',
        'link': 'https://still_here.netlify.app/privacy-policy/',
        'image': 'assets/images/icons/ic_term.png',
      },
      {
        'title': 'FAQ',
        'link': 'https://still_here.netlify.app/faq',
        'image': 'assets/images/icons/ic_faq.png',
      },
    ],

    /// Share app
    'shareApp': {
      'message': 'Still Here - Một lời hỏi thăm nhỏ mỗi ngày',
      'links': {
        'android':
            'https://play.google.com/store/apps/details?id=com.snapeditify.stillhere',
        'ios': 'https://apps.apple.com/app/idXXXXXXXX',
        'huawei': 'https://appgallery.huawei.com/app/C107645049',
      },
    },

    /// Update app
    'updateApp': {
      'version': '1.0.0',
      'required': false,
      'links': {
        'android':
            'https://play.google.com/store/apps/details?id=com.snapeditify.stillhere',
        'ios': 'https://apps.apple.com/app/idXXXXXXXX',
        'huawei': 'https://appgallery.huawei.com/app/C107645049',
      },
    },

    // No cross-promotion of unrelated games in this wellbeing app.
    'moreApps': [],
  },

  //! ====================================== ADVERTISEMENT ==============================================
  /// Full multi-provider: Google AdMob (Play/App Store) + Huawei (AppGallery).
  /// Replace test unit IDs with production IDs before store submit.
  "advertisement": {
    "enable": true,
    "adMobAppIdIos":
        "ca-app-pub-3940256099942544~1458002511", // TODO: production
    "adMobAppIdAndroid":
        "ca-app-pub-3940256099942544~3347511713", // TODO: production
    "providers": ["huawei"],
    "ads": [
      // --- GOOGLE AdMob (use test IDs until production) ---
      {
        "type": "banner",
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/2934735716",
        "androidId": "ca-app-pub-3940256099942544/6300978111",
      },
      {
        "type": "interstitial",
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/4411468910",
        "androidId": "ca-app-pub-3940256099942544/1033173712",
      },
      {
        "type": "reward",
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/1712485313",
        "androidId": "ca-app-pub-3940256099942544/5224354917",
      },
      {
        "type": "splash",
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/5575463023",
        "androidId": "ca-app-pub-3940256099942544/3419835294",
      },
      {
        "type": "native",
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/3986624511",
        "androidId": "ca-app-pub-3940256099942544/2247696110",
      },
      // --- HUAWEI ---
      {
        "type": "roll",
        "provider": "huawei",
        "iosId": "h2bea5p6f4",
        "androidId": "h2bea5p6f4",
      },
      {
        "type": "interstitial",
        "provider": "huawei",
        "iosId": "r0o9tg4ocx",
        "androidId": "r0o9tg4ocx",
      },
      {
        "type": "reward",
        "provider": "huawei",
        "iosId": "h7s9d468ol",
        "androidId": "h7s9d468ol",
      },
      {
        "type": "splash",
        "provider": "huawei",
        "iosId": "t17z7pus7m",
        "androidId": "t17z7pus7m",
      },
      {
        "type": "banner",
        "provider": "huawei",
        "iosId": "v7y4ozn8r7",
        "androidId": "v7y4ozn8r7",
      },
    ],
  },

  //! ====================================== IAP ==============================================
  /// Multi-store: Google Play Billing + App Store + Huawei IAP.
  /// Create matching product IDs on each console before release.
  "iap": {
    "enable": true,
    "providers": ["huawei"],
    "products": [
      {
        "type": "subscriptions",
        "provider": "google",
        "id": "still_here_premium_month",
        "info": {
          "name": "Premium Monthly",
          "description": "Remove ads and unlock premium features for 1 month.",
          "price": "\$2.99",
          "rawPrice": "2.99",
          "currency": "USD",
        },
      },
      {
        "type": "subscriptions",
        "provider": "google",
        "id": "still_here_premium_year",
        "info": {
          "name": "Premium Yearly",
          "description": "Remove ads and unlock premium features for 1 year.",
          "price": "\$19.99",
          "rawPrice": "19.99",
          "currency": "USD",
        },
      },
      {
        "type": "subscriptions",
        "provider": "apple",
        "id": "still_here_premium_month",
        "info": {
          "name": "Premium Monthly",
          "description": "Remove ads and unlock premium features for 1 month.",
          "price": "\$2.99",
          "rawPrice": "2.99",
          "currency": "USD",
        },
      },
      {
        "type": "subscriptions",
        "provider": "apple",
        "id": "still_here_premium_year",
        "info": {
          "name": "Premium Yearly",
          "description": "Remove ads and unlock premium features for 1 year.",
          "price": "\$19.99",
          "rawPrice": "19.99",
          "currency": "USD",
        },
      },
      {
        "type": "subscriptions",
        "provider": "huawei",
        "id": "app.still_here.studio.amonth",
        "info": {
          "name": "Premium Monthly",
          "description": "Remove ads and unlock premium features for 1 month.",
          "price": "\$2.99",
          "rawPrice": "2.99",
          "currency": "USD",
        },
      },
      {
        "type": "subscriptions",
        "provider": "huawei",
        "id": "app.still_here.studio.oneyear",
        "info": {
          "name": "Premium Yearly",
          "description": "Remove ads and unlock premium features for 1 year.",
          "price": "\$19.99",
          "rawPrice": "19.99",
          "currency": "USD",
        },
      },
    ],
  },

  //! ====================================== ANALYTICS ==============================================
  "analytics": {
    "enable": true,
    "providers": ["huawei"],
  },

  //! ====================================== AI (Gemini free tier) ==============================================
  /// Get free API key: https://aistudio.google.com/apikey
  /// Prefer injecting via remote config in production; do not hardcode real key in repo.
  "ai": {
    "enable": true,
    "provider": "gemini",
    "model": "gemini-2.0-flash",
    "apiKey":
        "AQ.Ab8RN6KihcPdtqk2wXBBXy124Iu4i72KOMdSeyB1wnrkuYnEsw", // set via remote config or --dart-define=GEMINI_API_KEY=xxx
  },
};
