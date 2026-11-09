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
        'android': 'https://appgallery.huawei.com/app/C107645049',
        'ios': 'https://appgallery.huawei.com/app/C107645049',
        'huawei': 'https://appgallery.huawei.com/app/C107645049',
      },
    },

    /// Update app
    'updateApp': {
      'version': '1.0.0',
      'required': false,
      'links': {
        'android': 'https://appgallery.huawei.com/app/C107645049',
        'ios': 'https://appgallery.huawei.com/app/C107645049',
        'huawei': 'https://appgallery.huawei.com/app/C107645049',
      },
    },

    // No cross-promotion of unrelated games in this wellbeing app.
    'moreApps': [],
  },

  //! ====================================== ADVERTISEMENT ==============================================
  "advertisement": {
    "enable": true,
    "adMobAppIdIos": "",
    "adMobAppIdAndroid": "",
    "providers": ["huawei"],
    "ads": [
      /// HUAWEI
      // {
      //   "type": "native",
      //   "provider": "huawei",
      //   "iosId": "l28y76h1or",
      //   "androidId": "h2bea5p6f4",
      // },
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
  "iap": {
    "enable": true,
    "providers": ["huawei"],
    "products": [
      {
        "type": "subscriptions",
        "provider": "huawei",
        "id": "app.still_here.studio.amonth",
        "info": {
          "name": "A Month",
          "description":
              "This is lisence for a month use us service like. Thanks for purchase.",
          "price": "\$2.46",
          "rawPrice": '2',
          "currency": "GBP",
        },
      },
      {
        "type": "subscriptions",
        "provider": "huawei",
        "id": "app.still_here.studio.oneyear",
        "info": {
          "name": "A Month",
          "description":
              "This is lisence for a month use us service like. Thanks for purchase.",
          "price": "\$2.46",
          "rawPrice": '2',
          "currency": "GBP",
        },
      },
    ],
  },

  //! ====================================== ANALYTICS ==============================================
  "analytics": {
    "enable": true,
    "providers": ["huawei"],
  },
};
