# Flutter Common Components

This project provides a collection of reusable Flutter components for common tasks such as image picking, file picking, date and time selection, and more. It is designed to simplify the integration of these functionalities into your Flutter applications.

## Features

- **Image Picker**: Pick single or multiple images from the gallery.
- **File Picker**: Pick single or multiple files with optional file type filtering.
- **Date Picker**: Select a date using a calendar interface.
- **Time Picker**: Select a time using a clock interface.
- **Reactive State Management**: Uses `GetX` for reactive state management.

## Getting Started

### Prerequisites

- Flutter SDK installed on your machine.
- `GetX`, `file_picker`, and `image_picker` packages added to your `pubspec.yaml`.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/flutter_common_components.git
   cd flutter_common_components
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### File Structure

```
lib/
├── commen_fields.dart       # Contains reusable methods for image, file, date, and time pickers.
├── FrontendIntegration.dart # Demonstrates the usage of common methods in a UI.
├── main.dart                # Entry point of the application.
```

### Usage

#### Image Picker
- **Pick Single Image**:
  ```dart
  pickImage(isMultiple: false);
  ```
- **Pick Multiple Images**:
  ```dart
  pickImage(isMultiple: true);
  ```

#### File Picker
- **Pick Single File**:
  ```dart
  pickFiles(isMultiple: false);
  ```
- **Pick Multiple Files**:
  ```dart
  pickFiles(isMultiple: true);
  ```

#### Date Picker
- **Pick a Date**:
  ```dart
  pickDate(context);
  ```

#### Time Picker
- **Pick a Time**:
  ```dart
  pickTime(context);
  ```

### Screenshots

| Feature         | Screenshot |
|------------------|------------|
| Image Picker     | ![Image Picker](https://as2.ftcdn.net/v2/jpg/03/17/25/45/1000_F_317254576_lKDALRrvGoBr7gQSa1k4kJBx7O2D15dc.jpg) |
| File Picker      | ![File Picker](path/to/file_picker_screenshot.png) |
| Date Picker      | ![Date Picker](path/to/date_picker_screenshot.png) |
| Time Picker      | ![Time Picker](path/to/time_picker_screenshot.png) |

### Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

### License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

### Contact

For any questions or feedback, feel free to reach out at your-email@example.com.
