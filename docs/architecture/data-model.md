# Data model

## CheckIn
- localDate (yyyy-MM-dd)
- status: OK | SHARE | SELF_CARE
- note?: string ≤ 500
- createdAt / updatedAt

## Greeting cache
- cacheKey, greetingText, source AI|STATIC
- timeBucket: MORNING|AFTERNOON|EVENING
- language, expiresAtUtc

## Settings (map)
- language (default en)
- themeMode
- reminder enabled + time
- ai.enabled
