# Flashlight App

A Flutter app that allows users to toggle the device's flashlight (torch) on and off.

## Overview

This Flutter app demonstrates how to control the flashlight functionality using the `camera` package. The app provides a toggle button that turns the flashlight on and off. The `camera` package is used to access the device's camera hardware and control the flashlight.

## Getting Started

### Prerequisites

- Flutter SDK: Make sure you have Flutter installed. If not, follow the official installation guide: https://flutter.dev/docs/get-started/install
- An integrated development environment (IDE) like Android Studio or Visual Studio Code is recommended.

### Installation

1. Create new flutter project:
   ```sh
   flutter create flashlight_app
   ```

2. Navigate to the project directory:
   ```sh
   cd flashlight_app
   ```

3. Add the `camera` package to your `pubspec.yaml` file:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     camera: ^0.10.0
   ```

4. Install dependencies:
   ```sh
   flutter pub get
   ```

### Usage

1. Open the `lib/main.dart` file.

2. Run the app:
   ```sh
   flutter run
   ```

3. The app will display a button labeled "Turn On 🔦" or "Turn Off 🔦" based on the current flashlight state.

4. Press the button to toggle the flashlight on and off.

### Camera Permission

- Make sure to grant camera permission to the app on the device. On most devices, the app will request permission automatically. However, you might need to manually grant permission through the device's settings if required.

## Dependencies

- [camera](https://pub.dev/packages/camera): Used to access the device's camera hardware and control the flashlight functionality.
