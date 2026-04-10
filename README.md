# Fitness Tracker App - Exhaustive Documentation

Welcome to the Fitness Tracker project. This document provides a complete, granular breakdown of every file, its purpose, its logic, and how it fits into the overall architecture.

---

## 🚀 1. Technology Stack & Decision Rationale

| Technology | Purpose | Implementation Detail |
| :--- | :--- | :--- |
| **Flutter SDK (v3.10+)** | Framework | Used for its high-performance Skia/Impeller rendering and expressive UI. |
| **GetX** | State & Routing | Chosen for its decoupled state management (`GetxController`) and simple, dependency-injection-free routing. |
| **Google Fonts** | Typography | Uses the `multish` font family for a clean, modern aesthetic. |
| **Flutter SVG** | Media | Handles all `.svg` icons and assets to ensure crispness on high-pixel-density screens. |

---

## 📂 2. Directory Structure

- `lib/core`: The "Heart" of the app. Contains the design system, shared constants, and utility extensions.
- `lib/viewmodels`: The "Brain". Contains the business logic and reactive state.
- `lib/views`: The "Body". Contains the UI screens.
- `lib/widgets`: The "Limbs". Small, reusable UI components.
- `lib/routes`: The "Map". Defines how the user moves between screens.

---

## 🛠️ 3. Exhaustive File Breakdown

### 📂 lib/core/ (Design System & Utilities)

#### `constants/app_assets.dart`
- **Purpose:** Centralizes all asset paths (SVG icons, PNG images).
- **Logic:** Uses static constants so that if a file path changes, we only update it here once.

#### `extensions/space_extension.dart`
- **Purpose:** Simplifies UI spacing.
- **Code:**
```dart
extension SpaceExtension on num {
  Widget get h => SizedBox(height: toDouble());
  Widget get w => SizedBox(width: toDouble());
}
```
- **Logic:** Extends the `num` class (integers/doubles) to return a `SizedBox`. Instead of `SizedBox(height: 10)`, we write `10.h`.

#### `theme/app_colors.dart`
- **Purpose:** Defines the Hex-color palette for the Dark Mode theme.
- **Logic:** Ensures UI consistency by using named colors like `primaryGreen` and `surface`.

#### `theme/app_fonts.dart`
- **Purpose:** Defines global text styles using `GoogleFonts`.
- **Logic:** Creates getters for `heading`, `body`, and `navLabel`, centralizing typography control.

---

### 📂 lib/viewmodels/ (State Management)

#### `home_controller.dart`
- **Stored State:** `selectedDate`, `calories`, `weight`, `hydrationLog`.
- **Key Function:** `addWater(int ml)`
  ```dart
  void addWater(int ml) {
    hydrationLog.value += ml;
    // Calculation for percentage progress
    hydrationPercentage.value = ((hydrationLog.value / hydrationGoal.value) * 100).toInt();
  }
  ```
- **Used in:** `HomeView`.

#### `mood_controller.dart`
- **Stored State:** `currentAngle` (for the radial slider).
- **Key Logic:** Converts the slider's rotation angle (0-360) into a specific mood (Calm, Content, etc.).
- **Used in:** `MoodView`.

#### `main_viewmodel.dart`
- **Stored State:** `currentIndex` (tracks the active navigation tab).
- **Used in:** `MainView`.

---

### 📂 lib/widgets/ (Reusable Components)

#### `hydration_card.dart`
- **Purpose:** A custom visualizer for water intake.
- **Logic:** Uses a `Stack` to layer Y-axis labels ('2 L', '0 L') and a `Column` of containers to create custom dash indicators for the fill level.

#### `insight_cards.dart`
- **Purpose:** Displays side-by-side progress for Calories and Weight.
- **Logic:** Uses a `LinearProgressIndicator` to visualize calorie consumption vs. goal.

#### `workout_card.dart`
- **Purpose:** A stylized row for workout sessions.
- **Logic:** Uses `IntrinsicHeight` so the decorative left border always matches the height of the text.

#### `calendar_row.dart`
- **Purpose:** A horizontal weekly calendar selector.
- **Logic:** Maps over a list of dates and applies a circular green border to the `selectedDate`.

#### `calendar_bottom_sheet.dart`
- **Purpose:** A full-month calendar flyout.
- **Logic:** Uses `GridView.builder` to dynamically generate day cells (1-30).

---

### 📂 lib/views/ (Screens)

#### `main_view.dart`
- **Role:** The application shell.
- **Content:** Contains the `Scaffold` and `BottomNavigationBar`. It switches between the different views based on the `MainViewModel` state.

#### `home_view.dart`
- **Role:** Dashboard screen.
- **Content:** Aggregates `CalendarRow`, `WorkoutCard`, `InsightCards`, and `HydrationCard`.

#### `mood_view.dart`
- **Role:** Interactive mood selector.
- **Content:** Features a custom manual slider (`_buildMoodSlider`) that tracks user thumb movement to update the mood.

---

### 📂 lib/routes/

#### `app_routes.dart`
- **Purpose:** Handles navigation transitions.
- **Logic:** Uses a `switch` statement on `settings.name` to return the appropriate `MaterialPageRoute`.

---

## 🚦 How to Build and Run

1.  **Clone the Repo**:
    `git clone <repo-url>`
2.  **Install Plugins**:
    `flutter pub get`
3.  **Run Dev Mode**:
    `flutter run`
