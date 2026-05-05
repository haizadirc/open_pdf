import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_pdf/open_pdf_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelOpenPdf platform = MethodChannelOpenPdf();
  const MethodChannel channel = MethodChannel('open_pdf');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          if (methodCall.method == 'open') {
            return true;
          }
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('open', () async {
    expect(await platform.open('test.pdf'), true);
  });
}
