Overview

This To-Do Application is built using Flutter with Bloc/Cubit for state management and a REST API for the backend, following the MVVM architecture. It offers secure authentication, CRUD functionalities, QR code generation, and more.

Features

State Management: Implemented using Bloc/Cubit.

Authentication: Secure phone number authentication with country-based validation.

Token Handling: Managed refresh tokens with HTTP status codes (401, 403, 200).

Pagination: Infinite scroll with loading, empty, and error states.

QR Codes: Generated unique QR codes for each task based on its ID.

Media Integration: Added task images from the gallery or camera.

CRUD Operations: Comprehensive Create, Read, Update, and Delete functionalities.

Responsive UI: Designed a seamless experience across different devices.

Installation

Clone the repository:

git clone https://github.com/yourusername/todo-app.git

Navigate to the project directory:

cd todo-app

Install dependencies:

flutter pub get

Run the app:

flutter run

Project Structure

lib/
├── main.dart
└── src/
    ├── models/
    ├── views/
    ├── controllers/
    ├── services/
    └── blocs/

models: Data models for tasks.

views: UI components and screens.

controllers: Business logic and state management.

services: API services and token handling.

blocs: Bloc and Cubit classes for state management.

Dependencies

Flutter SDK

Bloc/Cubit

Dio (for HTTP requests)

QR Flutter (for QR code generation)

Camera Plugin (for capturing task images)

Cached Network Image (for efficient image loading)

Flutter Secure Storage (for storing tokens securely)
