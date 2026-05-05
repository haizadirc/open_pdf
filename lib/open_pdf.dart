
import 'open_pdf_platform_interface.dart';

class OpenPdf {
  /// Opens the PDF file at the given [filePath].
  /// Returns a Future<bool> indicating if the operation was successful.
  static Future<bool> open(String filePath) {
    return OpenPdfPlatform.instance.open(filePath);
  }
}
