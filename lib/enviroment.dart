const enviroment = {
  //! ====================================== REMOTE CONFIG ==============================================
  "remoteConfig": {
    "enable": true,
    "providers": ["huawei"],
    'fetchTimeout': 60000, // 1 minutes
    'minimumFetchInterval': 60000, // 1 minutes
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
          "We're very sorry for the inconvenience but we're performing maintenance. Please check back soon ...",
      'link': 'https://snapeditify.netlify.app',
    },

    /// Display name is used in app
    'appName': 'Still Here',

    /// Version
    'version': '1.1.0',

    /// Logo is used in splash screen and app ui
    'appLogo': 'assets/images/logo.png',

    'appBio': 'A small hello every day',

    /// Protocols is use to check
    'protocols': ['https://', 'http://', 'data:'],

    /// Prefix stored key
    'prefix': 'com.snapeditify.stillhere.',

    /// Contact
    'contact': 'contact.snapeditify@gmail.com',

    /// Social Networks
    'socialNetworks': [
      {
        'brand': 'Facebook',
        'link': 'https://www.facebook.com/snapeditify/',
        'image':
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/600px-Facebook_Logo_%282019%29.png',
      },
      {
        'brand': 'Tiktok',
        'link': 'https://www.tiktok.com/@snapeditify',
        'image':
            'https://cdn4.iconfinder.com/data/icons/social-media-flat-7/64/Social-media_Tiktok-512.png',
      },
      {
        'brand': 'Youtube',
        'link': 'https://www.youtube.com/@snapeditify',
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
        'link': 'https://snapeditify.netlify.app/terms-of-service',
        'image': 'assets/images/icons/privacy.png',
      },
      {
        'title': 'Privacy policy',
        'link': 'https://snapeditify.netlify.app/privacy-policy/',
        'image': 'assets/images/icons/privacy.png',
      },
      {
        'title': 'FAQ',
        'link': 'https://snapeditify.netlify.app/faq',
        'image': 'assets/images/icons/faq.png',
      },
    ],

    /// Share app — replace iOS id after App Store Connect create
    'shareApp': {
      'message': 'Still Here - A small hello every day',
      'links': {
        'android':
            'https://play.google.com/store/apps/details?id=com.snapeditify.stillhere',
        'ios':
            'https://apps.apple.com/app/idXXXXXXXX', // TODO: replace after App Store Connect
        'huawei': 'https://appgallery.huawei.com/app/C107645049',
      },
    },

    /// Update app
    'updateApp': {
      'version': '1.1.0',
      'required': false,
      'links': {
        'android':
            'https://play.google.com/store/apps/details?id=com.snapeditify.stillhere',
        'ios':
            'https://apps.apple.com/app/idXXXXXXXX', // TODO: replace after App Store Connect
        'huawei': 'https://appgallery.huawei.com/app/C107645049',
      },
    },

    'moreApps': [
      {
        "name": "Candy Land Puzzle: Match Game",
        "logo":
            "https://appimg2.dbankcdn.com/application/icon144/65/6124af2abde64858915de34600bf4e24.png",
        "desc": "Candy Land Puzzle is a new and stylish candy...",
        "links": {
          "android": "https://appgallery.huawei.com/app/C108228683",
          "ios": "https://appgallery.huawei.com/app/C108228683",
          "huawei": "https://appgallery.huawei.com/app/C108228683",
        },
      },
      {
        "name": "Fall Dudes 3D: Amazing Run",
        "logo":
            "https://appimg2.dbankcdn.com/application/icon144/65/ae2086a83fd64cc9bde0d41b0305f20b.png",
        "desc": "Fall Dudes 3D: Super Tricky Amazing...",
        "links": {
          "android": "https://appgallery.huawei.com/app/C108199945",
          "ios": "https://appgallery.huawei.com/app/C108199945",
          "huawei": "https://appgallery.huawei.com/app/C108199945",
        },
      },
      {
        "name": "Car Mega Ramps",
        "logo":
            "https://appimg2.dbankcdn.com/application/icon144/65/6575b038b8534b3387bc4d1e6be163ac.png",
        "desc": "Car Mega Ramps games has an...",
        "links": {
          "android": "https://appgallery.huawei.com/app/C108175001",
          "ios": "https://appgallery.huawei.com/app/C108175001",
          "huawei": "https://appgallery.huawei.com/app/C108175001",
        },
      },
      {
        "name": "Sweet Ice Cream Maker",
        "logo":
            "https://appimg2.dbankcdn.com/application/icon144/65/c5da0f730f4343269bd6bcd430315397.png",
        "desc": "Are you an ice cream lover? You will...",
        "links": {
          "android": "https://appgallery.huawei.com/app/C108210943",
          "ios": "https://appgallery.huawei.com/app/C108210943",
          "huawei": "https://appgallery.huawei.com/app/C108210943",
        },
      },
    ],
  },

  //! ====================================== ADVERTISEMENT ==============================================
  /// Multi-provider: Google AdMob (Play/App Store) + Huawei (AppGallery).
  /// IMPORTANT: Replace all test / placeholder unit IDs with production IDs before store submit.
  /// Current AdMob App IDs below are Google sample test IDs.
  "advertisement": {
    "enable": true,
    "adMobAppIdIos":
        "ca-app-pub-3940256099942544~1458002511", // TODO: production AdMob iOS App ID
    "adMobAppIdAndroid":
        "ca-app-pub-3940256099942544~3347511713", // TODO: production AdMob Android App ID
    "providers": ["huawei"],
    "ads": [
      // --- HUAWEI ---
      {
        "type": "roll",
        "provider": "huawei",
        "iosId": "h9mo3gowf9",
        "androidId": "h9mo3gowf9",
      },
      {
        "type": "interstitial",
        "provider": "huawei",
        "iosId": "i6mhdflr4j",
        "androidId": "i6mhdflr4j",
        "waitingTimeToDisplay": 300,
      },
      {
        "type": "reward",
        "provider": "huawei",
        "iosId": "r63jxgtnzy",
        "androidId": "r63jxgtnzy",
      },
      {
        "type": "splash",
        "provider": "huawei",
        "iosId": "h3qy68ry9r",
        "androidId": "h3qy68ry9r",
      },
      {
        "type": "banner",
        "provider": "huawei",
        "iosId": "n76vsi3rp9",
        "androidId": "n76vsi3rp9",
      },
    ],
  },

  //! ====================================== IAP ==============================================
  /// Multi-store: Google Play Billing + App Store + Huawei IAP.
  /// Create matching product IDs on each console before release.
  /// Product IDs below are shared logical IDs — map them in each store console.
  "iap": {
    "enable": true,
    "providers": ["huawei"],
    // Product type is per-item: nonConsumables | subscriptions | consumables.
    // Must match AppGallery Connect for each product id.
    "products": [
      {
        "type": "nonConsumables",
        "provider": "huawei",
        "id": "com.snapeditify.stillhere.lifetime",
        "info": {
          "name": "Premium Lifetime",
          "description": "One-time purchase. Remove ads forever.",
          "price": "\$39.99",
          "rawPrice": "39.99",
          "currency": "USD",
        },
      },
      // {
      //   "type": "subscriptions",
      //   "provider": "huawei",
      //   "id": "com.snapeditify.stillhere.amonth",
      //   "info": {
      //     "name": "Premium Monthly",
      //     "description": "Remove ads and unlock premium features for 1 month.",
      //     "price": "\$2.99",
      //     "rawPrice": "2.99",
      //     "currency": "USD",
      //   },
      // },
      // {
      //   "type": "subscriptions",
      //   "provider": "huawei",
      //   "id": "com.snapeditify.stillhere.oneyear",
      //   "info": {
      //     "name": "Premium Yearly",
      //     "description": "Remove ads and unlock premium features for 1 year.",
      //     "price": "\$19.99",
      //     "rawPrice": "19.99",
      //     "currency": "USD",
      //   },
      // },
    ],
  },

  //! ====================================== ANALYTICS ==============================================
  "analytics": {
    "enable": true,
    "providers": ["huawei"],
  },

  //! ====================================== AI (Gemini free tier) ==============================================
  /// Get free API key: https://aistudio.google.com/apikey
  /// Prefer injecting via remote config or --dart-define=GEMINI_API_KEY=xxx in production.
  /// Do not commit a real production key long-term.
  "ai": {
    "enable": true,
    "provider": "gemini",
    "model": "gemini-2.0-flash",
    "apiKey":
        "AQ.Ab8RN6KihcPdtqk2wXBBXy124Iu4i72KOMdSeyB1wnrkuYnEsw", // prefer remote config / dart-define
  },
};
