# Deployment

## Android
1. Fill `android/key.properties` from example (not committed)
2. `flutter build appbundle --release`
3. Play Console → production track

## iOS
1. Xcode signing team + bundle `com.snapeditify.stillhere`
2. `flutter build ipa --release`
3. Transporter / App Store Connect

## Pre-flight
See `PRODUCTION_CHECKLIST.md`
