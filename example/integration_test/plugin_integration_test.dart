// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:open_pdf/open_pdf.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('open test', (WidgetTester tester) async {
    // Note: This test calls the native side. 
    // Since we don't have a real file here, we just verify the call doesn't crash.
    final bool result = await OpenPdf.open('non_existent_file.pdf');
    expect(result, false);
  });
}
