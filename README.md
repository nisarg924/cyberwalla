# Cyber Security App

# assignmentcw

## Overview

The Cyber Security App is a Flutter-based application that provides functionalities such as user authentication, user profile management, community interaction, and reading articles and news related to cybersecurity. Users can sign up, log in, reset their passwords, edit their profiles, post questions and answers, and read and bookmark articles.

## Features

1. **User Authentication**
   - Sign up and log in functionality
   - Password reset option

2. **User Profile**
   - Create and edit profile, including profile picture, bio, and interests

3. **Community Interaction**
   - Post questions and answers
   - Like and comment on posts

4. **Articles and News**
   - Read articles and news related to cybersecurity
   - Bookmark favorite articles for later reading

5. **Search and Filter**
   - Search and filter functionality for easy content discovery

## Architecture

The app follows a modular architecture with the following key components:

1. **Authentication Service**
   - Handles user authentication using Firebase Authentication
   - Provides methods for sign up, log in, password reset, and sign out

2. **Profile Management**
   - Retrieves and updates user profile information from Firestore
   - Allows users to edit their bio and interests

3. **Community Interaction**
   - Manages community posts in Firestore
   - Enables users to create, like, and comment on posts

4. **Articles and News**
   - Manages articles in Firestore
   - Provides functionality to bookmark articles

## Setup Instructions

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase Account: [Create Firebase Project](https://firebase.google.com/)
- Android Studio or VS Code

### Firebase Setup

1. Create a Firebase project in the Firebase console.
2. Enable Authentication (Email/Password).
3. Enable Firestore Database.
4. Download the `google-services.json` file and place it in the `android/app` directory.
5. Download the `GoogleService-Info.plist` file and place it in the `ios/Runner` directory.

### Firestore Collections

1. **users**
   - Document ID: User UID
   - Fields: `email`, `bio`, `interests`

2. **community_posts**
   - Fields: `uid`, `content`, `timestamp`

3. **articles**
   - Fields: `uid`, `title`, `content`, `timestamp`

### Running the App

1. **Clone the repository**:

2. **Install dependencies**:
    - flutter pub get

3. **Run the app on an emulator or connected device**:
    - flutter run

### Directory structure

lib/
|-- main.dart
|-- authentication_service.dart
|-- screens/
|   |-- login_screen.dart
|   |-- sign_up_screen.dart
|   |-- profile_screen.dart
|   |-- edit_profile_screen.dart
|   |-- community_screen.dart
|   |-- article_screen.dart
|-- widgets/
|   |-- post_widget.dart
|   |-- article_widget.dart
assets/
|-- placeholder.png

### Design Decisions

1. **Provider for State Management**:
   - The app uses the Provider package to manage state, making it easier to manage and pass down state to the widget tree.

2. **Modular Structure**:
   - Each feature is separated into different screens and services, promoting code reusability and maintainability.

3. **Firebase Integration**:
   - Firebase Authentication and Firestore are used for user management and data storage, providing a scalable backend solution.

4. **User Experience**: 
   - The UI is designed to be clean and user-friendly, ensuring a smooth experience for users interacting with the app.