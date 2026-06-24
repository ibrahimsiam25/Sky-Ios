# Sky ⛅️

Sky is a modern iOS weather application built with Swift and SwiftUI. It provides users with up-to-date weather forecasts and allows them to manage their favorite cities.

## Features

- **Current Weather:** View real-time weather conditions for your selected locations.
- **Hourly Forecast:** Get detailed hourly weather updates with beautiful UI.
- **City Management:** Search for new cities, add them to your list, and easily manage your favorite locations.
- **Light & Dark Mode Support:** Seamlessly adapts to your system's appearance settings.

## Technologies & Architecture

- **Frameworks:** SwiftUI, Combine
- **Architecture:** MVVM (Model-View-ViewModel) with Clean Architecture principles.
- **Design Pattern:** Modular design separated by features (`Home`, `Cities`).
- **Dependency Injection:** Utilizing an `AppContainer` for scalable dependency management.

## Project Structure

The project is modularized by features:
- `Home/`: Contains the logic and views for displaying weather forecasts.
- `Cities/`: Handles searching, adding, and managing the user's city list.

## Getting Started

1. Clone this repository.
2. Open `Sky.xcodeproj` in Xcode.
3. Build and run the application on your simulator or physical device.

---
*Developed with ❤️ using SwiftUI.*
