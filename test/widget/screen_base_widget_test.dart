import 'package:chorus/widget/screen_base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Verify bottom logo displayed', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ScreenBaseWidget()));
    expect(find.byType(SvgPicture), findsOneWidget);
  });

  testWidgets('Verify divider displayed', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ScreenBaseWidget()));
    expect(find.byType(Divider), findsOneWidget);
  });
}
