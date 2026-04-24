import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_animations/app/app.dart';
import 'package:flutter_animations/demos/pulse_orb/view.dart';
import 'package:flutter_animations/demos/pulse_orb/widget.dart';

void main() {
  testWidgets('home screen shows animation gallery', (tester) async {
    await tester.pumpWidget(const FlutterAnimationsApp());
    await tester.pumpAndSettle();

    expect(find.text('Flutter Animations'), findsOneWidget);
    expect(find.text('Pulse Orb'), findsOneWidget);
    expect(find.text('Open demo'), findsOneWidget);
  });

  testWidgets('pulse orb demo screen builds', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: PulseOrbDemoView()),
    );
    await tester.pump();

    expect(find.byType(PulseOrbDemo), findsOneWidget);
  });
}
