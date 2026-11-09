# ADR-0001: Local-first storage

## Decision
Persist check-ins and settings on-device via SharedPreferences wrapper. No user account.

## Consequences
+ Privacy, offline, simple MVP
- No multi-device sync; backup depends on OS
