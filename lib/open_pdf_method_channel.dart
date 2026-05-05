import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'open_pdf_platform_interface.dart';

/// An implementation of [OpenPdfPlatform] that uses method channels.
class MethodChannelOpenPdf extends OpenPdfPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('open_pdf');

  @override
  Future<bool> open(String filePath) async {
    final result = await methodChannel.invokeMethod<bool>(
      'open',
      {'filePath': filePath},
    );
    return result ?? false;
  }
}
