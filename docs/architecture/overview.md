# Architecture overview

```
UI (features/*/presentation, pages/*)
    ↓
Services (checkin, greeting, premium, reminder, export)
    ↓
LocalStorage (SharedPreferences via fluttering)
```

- **State:** StatefulWidget + service singletons; theme/locale via AppThemeProvider.
- **Ads / Analytics / IAP:** fluttering_* packages; gated by premium.
- **AI greeting:** optional remote prompt; falls back to static_greetings.
- **Design system:** AppColors + ThemeData light/dark + AppThemeColors extension.
