# avilatek_test

# 🎬 Movie App

A Flutter application that displays popular movies and actor profiles using The Movie Database (TMDb) API. The app follows a clean architecture pattern, utilizes Riverpod for state management, and integrates smooth animations and navigation.

## 🏗️ Architecture
The project follows the **Clean Architecture** pattern with three distinct layers:

### 1. **Domain Layer**
- Defines the business logic and rules.
- Contains abstract **repositories** and **datasources** that specify how data should be accessed.
- Ensures **data integrity**, making it easier to switch data sources without affecting other layers.

### 2. **Data Layer**
- Contains **data sources** responsible for fetching data from APIs.
- Implements repositories and datasources defined in the **Domain Layer**.
- Contains **models** that map API responses and **mappers** to transform them into app-friendly entities.

### 3. **Presentation Layer**
- Holds the **UI components (screens, widgets)**.
- Uses **Riverpod providers** for state management.
- Contains **cached state storage** to prevent redundant API calls and improve performance.
- Providers are located in this layer along with screens.

## 📦 State Management with Riverpod
- Uses **StateNotifierProvider** to manage API data efficiently.
- Before making an API call, the app checks if the data is already cached in memory.
- This improves performance and prevents unnecessary network requests when clicking on movies repeatedly.

## 🔑 API Key Management
- Uses the **dotenv** library to securely store the API key.
- The key is accessed throughout the app without being hardcoded, improving security.

## ✨ Animations
- Uses the **animate_do** library for smooth animations.
- Enhances user experience with well-integrated transitions.

## 🚏 Navigation
- Uses the **go_router** package for declarative routing.
- Provides a structured way to navigate between screens.

## 🔄 API Data Fetching
- Movie details are **fetched directly** from the API for real-time accuracy.
- Actor profiles are retrieved from **two separate endpoints**:
  - One for the **name and biography**.
  - Another for the **movies related to that actor**.

## 🎭 Default Images for Missing Content
- For movies or actors that do not have an image, a **default placeholder image** is provided.
- This enhances the user experience by maintaining a visually consistent UI.

## 🚀 Running the Project
To run the app, use the following command:
```sh
flutter run
```
Or, if using **VS Code**, click the play button in the **upper right corner** of the main file. Ensure you have a simulator or physical device running.

Enjoy exploring movies and actors! 🎥🍿




