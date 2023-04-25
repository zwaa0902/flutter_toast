// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/services.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test toast message', (WidgetTester tester) async {
    const channel = MethodChannel('flutter_toast');
    const message = 'Hello, world!';

    await tester.runAsync(() async {
      // Call showToast method
      await channel.invokeMethod('showToast', {'message': message});

      // Wait for toast to be displayed
      await tester.pumpAndSettle(const Duration(seconds: 2));
    });
  });
}
