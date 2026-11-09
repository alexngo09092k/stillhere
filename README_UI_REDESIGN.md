# StillHere — UI Redesign (match design.png)

## What changed

### Design system
- **Palette**: warm cream / peach / sage (replaces violet)
  - Brand: `#D4A574`, Soft: `#E8C4A0`, Accent sage: `#8BA888`
  - BG light: `#F7F2EB`, Surface: `#FFFCF9`
- Soft card shadows, peach CTA gradients, rounded 18–24px corners
- Light + Dark themes updated

### Navigation (4 tabs)
1. Trang chủ (Home)
2. Nhật ký (Journal / History) — calendar + recent entries
3. **Thống kê (Stats)** — NEW: week/month/year, mood bars, presence %
4. Cài đặt (Settings)

### Screens redesigned
| Screen | Notes |
|--------|--------|
| Home | Hero gradient card, quote, gradient CTA |
| Check-in | 3 mood cards (☀️☁️🌱) with title + subtitle |
| Success | Soft check, affirming copy, dual CTAs |
| History | Month calendar grid + recent list |
| Stats | Segment control + bars + progress ring |
| Settings | Grouped cards matching mockup |

### Business logic
- **Unchanged**: CheckInService, LocalStorage, GreetingService, Reminder, Premium, Analytics events (no mood/note sent)
- Mood enum still `OK | SHARE | SELF_CARE`
- Only presentation + one new Stats screen (reads existing data)

## How to apply

Copy the `lib/` tree from this package over your project `lib/`, preserving structure:

```bash
# from project root
cp -R path/to/stillhere_ui_redesign/lib/* lib/
flutter pub get
flutter run
```

New file to ensure is included:
- `lib/features/stats/presentation/stats_page.dart`

No new pub dependencies required.

## Optional polish later
- Hero photo assets (balcony / florals) behind Home card
- Custom fonts (e.g. serif titles) if brand kit provides them
- Lottie on Success
