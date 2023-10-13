import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_case/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//flutter test integration_test/app_test.dart
  testWidgets("Increment Counter by 10", (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle();

    //find the widget
    final Finder button = find.byIcon(Icons.add);

    //do
    for (int i = 0; i < 10; i++) {
      await tester.tap(button);
      await Future.delayed(const Duration(seconds: 1));
    }

    await tester.pumpAndSettle();

    //expectation
    expect(find.text("10"), findsOneWidget);
  });
}
