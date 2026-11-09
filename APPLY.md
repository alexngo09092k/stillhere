# StillHere UI Production Pack v2

Closer match to `design.png`: logo mark, hero sunrise card, success dark floral bg, 4-tab nav, warm peach system.

## Apply

From your Flutter project root:

```bash
# 1) UI + logic presentation layer
cp -R path/to/stillhere_prod_ui/lib/* lib/

# 2) Assets
mkdir -p assets/images store_assets
cp path/to/stillhere_prod_ui/assets/images/* assets/images/
cp path/to/stillhere_prod_ui/store_assets/* store_assets/

# 3) Ensure pubspec.yaml flutter.assets includes (see pubspec.yaml.snippet):
#    - assets/images/*.png|jpg listed in the snippet

flutter pub get
flutter run
```

## Store icons

Use `store_assets/still_here_app_icon_1024.png` to regenerate:
- Android adaptive icons
- iOS AppIcon.appiconset

```bash
# example with flutter_launcher_icons after configuring pubspec
flutter pub run flutter_launcher_icons
```

## What is production-ready here

- No change to check-in / storage / privacy / analytics contracts
- New Stats tab is read-only aggregation of local check-ins
- Assets are original generated brand marks (not third-party stock photos)
- If you need photoreal balcony/flower photography for marketing, swap
  `hero_sunrise.jpg` and `bg_success.jpg` with licensed images keeping the same filenames

## Files touched

- Theme / colors / assets constants
- Home, Check-in, Success, History, Stats, Settings, Splash, Onboarding
- Store icons 1024 & 512
