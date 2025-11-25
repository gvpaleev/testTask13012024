# Hotel Booking App

A Flutter-based hotel booking application built with Feature Sliced Design architecture.

## Features

- Browse hotel details with image carousel
- View hotel ratings and amenities
- Select available rooms
- Complete booking with customer information
- Order confirmation screen

## Tech Stack

- **Flutter** (SDK >=3.2.0 <4.0.0)
- **State Management**: BLoC pattern (flutter_bloc)
- **HTTP Client**: Dio
- **UI Components**: 
  - carousel_slider - Image galleries
  - flutter_svg - SVG icon support
  - mask_text_input_formatter - Input formatting
- **Environment**: flutter_dotenv

## Architecture

Built using [Feature Sliced Design](https://feature-sliced.design/ru/docs/get-started/overview) methodology.

## Project Structure

```
lib/
├── app/           # Application configuration
├── pages/         # Screen components
├── widgets/       # Reusable UI widgets
├── entities/      # Business entities
└── shared/        # Shared utilities
    ├── bloc/      # BLoC state management
    └── repository/ # Data layer
```

## Setup

1. Install Flutter SDK (>=3.2.0)
2. Clone the repository
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Ensure `.env` file exists with API endpoints

## Running the App

```bash
flutter run
```

For specific platforms:
```bash
flutter run -d chrome    # Web
flutter run -d macos     # macOS
flutter run -d linux     # Linux
flutter run -d windows   # Windows
```

## API Endpoints

The app uses mock API endpoints (configured in `.env`):
- Hotel data
- Room listings
- Booking information

## Demo

[Video demonstration](https://www.youtube.com/watch?v=Kdg49G6ahtc)

## Requirements Document

[Technical specification](https://docs.google.com/document/d/1odLvGFLlYBeI2EENJzjGiOsSfr8f2M_5AzdRGpsI4yQ/edit)
