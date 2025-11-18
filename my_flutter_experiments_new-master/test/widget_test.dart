// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_experiments/widgets_layouts_experiment.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our experiment and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Experiment2(),
        ),
      ),
    );

    // Verify that the experiment contains the expected text
    expect(find.text('Experiment 2: Basic Widgets & Layouts'), findsOneWidget);

    // Verify that the experiment contains some expected content
    expect(find.text('1. Text Widget'), findsOneWidget);
  });
}
