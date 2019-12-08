import 'package:chorus/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Verify logo displayed', (tester) async {
    await tester.pumpWidget(MaterialApp(home: SplashScreen()));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byType(SvgPicture), findsOneWidget);
  });
}
