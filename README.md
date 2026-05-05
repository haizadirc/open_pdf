# open_pdf

A lightweight Flutter plugin for opening PDF files on Android and iOS. This is a streamlined alternative to `open_file`, focused specifically on PDFs and supporting modern package managers like Swift Package Manager (SPM).

## Features

- 📄 **Lightweight**: Zero unnecessary dependencies, focused only on opening PDFs.
- 🛠️ **SPM Support**: Fully compatible with Swift Package Manager for iOS.
- 🤖 **Android FileProvider**: Pre-configured with a FileProvider to safely share files with other apps.
- 📱 **Native Previews**: Uses `UIDocumentInteractionController` on iOS for a native viewing experience.

## Installation

Add `open_pdf` to your `pubspec.yaml`:

```yaml
dependencies:
  open_pdf:
    path: path/to/open_pdf # or use git/pub version once published
```

### Android Setup

The plugin already includes a `FileProvider`. No additional setup is required unless you want to customize the file paths.

### iOS Setup

The plugin is ready to use with Swift Package Manager. Ensure your minimum deployment target is iOS 12.0 or higher.

## Usage

```dart
import 'package:open_pdf/open_pdf.dart';

// Open a PDF file by its local path
bool success = await OpenPdf.open('/path/to/your/file.pdf');

if (success) {
  print('PDF opened successfully');
} else {
  print('Could not open PDF');
}
```

## Example

Check the `example` folder for a complete demonstration that downloads and opens a sample PDF.

