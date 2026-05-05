import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'open_pdf_method_channel.dart';

abstract class OpenPdfPlatform extends PlatformInterface {
  /// Constructs a OpenPdfPlatform.
  OpenPdfPlatform() : super(token: _token);

  static final Object _token = Object();

  static OpenPdfPlatform _instance = MethodChannelOpenPdf();

  /// The default instance of [OpenPdfPlatform] to use.
  ///
  /// Defaults to [MethodChannelOpenPdf].
  static OpenPdfPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OpenPdfPlatform] when
  /// they register themselves.
  static set instance(OpenPdfPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> open(String filePath) {
    throw UnimplementedError('open() has not been implemented.');
  }
}
