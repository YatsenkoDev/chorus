import 'package:chorus/global/constants.dart';
import 'package:chorus/screen/insert_id_screen.dart';
import 'package:chorus/widget/screen_base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InsertIdScreen', () {
    testWidgets('Verify ScreenBaseWidget used', (tester) async {
      await tester.pumpWidget(MaterialApp(home: InsertIdScreen()));
      expect(find.byType(ScreenBaseWidget), findsOneWidget);
    });

    testWidgets('Verify id is prefilled', (tester) async {
      await tester.pumpWidget(MaterialApp(home: InsertIdScreen()));
      final idInput =
          find.byType(TextField).evaluate().single.widget as TextField;
      expect(idInput.controller.text, kPreFilledId);
    });

    testWidgets('Verify error is displayed for empty id', (tester) async {
      await tester.pumpWidget(MaterialApp(home: InsertIdScreen()));
      final finder = find.byType(TextField);
      await tester.enterText(finder, '');
      await tester.tap(find.byType(RaisedButton));
      await tester.pump();
      final idInput = finder.evaluate().single.widget as TextField;
      expect(idInput.decoration.errorText, isNotNull);
    });
  });
}
