# Taqsak

<div align="center">

![Taqsak Logo](https://img.shields.io/badge/iOS-17.0+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-UI-green.svg)
![SwiftData](https://img.shields.io/badge/SwiftData-Persistence-purple.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

**A beautiful, modern weather application built with SwiftUI**

</div>

## 🌤️ Features

- **Real-time Weather Data**: Fetches current weather and 3-day forecasts using the WeatherAPI
- **Location-based Weather**: Automatically detects user's location or searches for cities worldwide
- **Save Favorite Cities**: Save and manage your favorite locations with SwiftData persistence
- **Hourly Forecasts**: Detailed hourly weather breakdown for any day
- **Day/Night Themes**: Adaptive UI that changes based on time of day with beautiful gradient backgrounds
- **Modern UI/UX**: Clean, minimalist design with translucent glassmorphism effects using `.ultraThinMaterial`
- **Smooth Animations**: Fluid transitions and animations throughout the app
- **Search Functionality**: Quick city search with popular city suggestions
- **Swipe Actions**: Swipe-to-delete for saved locations with confirmation dialogs

## 🏗️ Architecture

Taqsak follows a modular MVVM architecture with feature-based organization:

```
Taqsak/
├── Application/
│   └── TaqsakApp.swift          # App entry point with SwiftData configuration
├── Core/
│   ├── Network/                 # API networking layer
│   ├── Theme/                   # App colors and fonts
│   ├── Location/                # Location management
│   └── Extension/               # Model extensions
├── Features/
│   ├── Home/                    # Main weather screen
│   │   ├── View/
│   │   │   ├── Components/      # Reusable UI components
│   │   │   └── HomeView.swift
│   │   ├── ViewModel/
│   │   └── Model/
│   ├── Search/                  # City search functionality
│   ├── SavedLocations/          # Saved cities management
│   ├── HourlyForecast/         # Hourly weather details
│   └── Splash/                  # Splash screen
```

## 🛠️ Tech Stack

- **Language**: Swift 5.9+
- **UI Framework**: SwiftUI
- **Persistence**: SwiftData (iOS 17+)
- **Networking**: URLSession
- **Architecture**: MVVM
- **Minimum iOS Version**: iOS 17.0

## 📦 Key Dependencies

- **SwiftUI**: Native iOS UI framework
- **SwiftData**: Apple's modern persistence framework
- **WeatherAPI**: Weather data provider (https://www.weatherapi.com/)

## 🚀 Getting Started

### Prerequisites

- Xcode 15.0 or later
- iOS 17.0+ SDK
- A WeatherAPI key (free at https://www.weatherapi.com/)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/Taqsak.git
cd Taqsak
```

2. Open the project in Xcode:
```bash
open Taqsak.xcodeproj
```

3. Add your WeatherAPI key:
   - Open `APIConstants.swift`
   - Replace the `apiKey` value with your own API key

4. Build and run:
   - Select a simulator or connected device
   - Press `Cmd + R` or click the Run button

## 🎨 UI Components

### Home Screen
- Current weather display with temperature, condition, and high/low
- 3-day forecast section
- Weather metrics grid (visibility, humidity, feels like, pressure)
- Custom navigation bar with search and saved locations

### Search Screen
- Real-time city search
- Popular cities quick access
- Save/unsave cities with bookmark button
- Tap to view weather for any city

### Saved Locations
- List of saved favorite cities
- Swipe-to-delete with confirmation
- Tap to load weather for saved city
- Empty state with helpful message

### Hourly Forecast
- Detailed hourly breakdown
- Temperature, condition, and rain chance
- Scrollable list for 24 hours

## 📱 Screenshots

*(Add screenshots of your app here)*

## 🔧 Configuration

### API Configuration

Edit `APIConstants.swift` to configure your API settings:

```swift
class APIConstants {
    static let apiKey = "YOUR_API_KEY_HERE"
    static let baseURL = "https://api.weatherapi.com/v1/forecast.json"
    static let searchURL = "https://api.weatherapi.com/v1/search.json"
}
```

### Theme Customization

Modify `AppColors.swift` and `AppFonts.swift` to customize the app's appearance:

```swift
struct AppColors {
    static let morningGradient = LinearGradient(...)
    static let eveningGradient = LinearGradient(...)
}

struct AppFonts {
    static let font42bold = Font.system(size: 42, weight: .bold, design: .rounded)
    // ... more fonts
}
```

## 🧭 Navigation Flow

```
SplashView
    ↓
HomeView (Main Screen)
    ├─→ WeatherSearchView
    │   ├─→ Popular Cities
    │   └─→ Search Results → HomeView
    └─→ SavedLocationsView
        └─→ City Selection → HomeView
    └─→ HourlyForecastView (from 3-day forecast)
```

## 💾 Data Persistence

Taqsak uses SwiftData to persist saved cities:

- **Model**: `SavedCity` with properties for name, region, country, and timestamp
- **Query**: Uses `@Query` to automatically fetch and observe saved cities
- **Context**: ModelContext injected via environment for CRUD operations

## 🎯 Key Features Implementation

### State Management
- `HomeViewModel` as shared state via `@EnvironmentObject`
- Centralized weather data and loading states
- Day/night mode detection based on time

### Background Styling
- Consistent use of `.ultraThinMaterial` for glassmorphism effect
- Adaptive opacity (0.7 for buttons, 0.75 for cards)
- Proper color handling for both light and dark modes

### Animations
- Spring animations for save/unsave actions
- Scale and opacity transitions for GPS reset button
- Smooth navigation transitions

## 🐛 Known Issues

None currently. Please report issues via GitHub Issues.

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

**Ahmed Nageh**
- GitHub: [@yourusername](https://github.com/yourusername)
- LinkedIn: [your-linkedin](https://linkedin.com/in/yourprofile)

## 🙏 Acknowledgments

- WeatherAPI for providing weather data
- Apple for SwiftUI and SwiftData frameworks
- The open-source community for inspiration and resources

## 📄 API Documentation

For more information about the WeatherAPI, visit: [https://www.weatherapi.com/docs/](https://www.weatherapi.com/docs/)

---

Made with ❤️ using SwiftUI
