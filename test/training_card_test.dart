import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hsma_cpd_trainit/widgets/training_card_widget.dart';

void main() {
  testWidgets('Test Rest timer', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TrainingCard()));
    expect(find.text('02:00'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('01:59'), findsOneWidget);
    // await tester.pump(const Duration(seconds: 1));
    // expect(find.text('01:58'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.pause));
    await tester.pump();
    expect(find.text('01:59'), findsOneWidget);

    // await tester.tap(find.byIcon(Icons.play_arrow));
    // await tester.pump();
    // expect(find.text('01:58'), findsOneWidget);
    // await tester.pump(const Duration(seconds: 1));
    // expect(find.text('01:57'), findsOneWidget);
    // await tester.tap(find.byIcon(Icons.stop));
    // await tester.pump();
    // expect(find.text('02:00'), findsOneWidget);
  });
}


