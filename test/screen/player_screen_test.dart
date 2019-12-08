import 'package:chorus/global/constants.dart';
import 'package:chorus/screen/player_screen.dart';
import 'package:chorus/widget/screen_base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PlayerScreen', () {
    testWidgets('Verify ScreenBaseWidget used', (tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: PlayerScreen(contentId: kPreFilledId)));
      expect(find.byType(ScreenBaseWidget), findsOneWidget);
    });

    testWidgets('Verify loader shown', (tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: PlayerScreen(contentId: kPreFilledId)));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
