import 'package:chorus/global/constants.dart';
import 'package:chorus/widget/transcript_element_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Verify message displayed', (tester) async {
    const messages = ['message'];
    await tester.pumpWidget(MaterialApp(
        home: TranscriptElementWidget(
            speaker: '', messages: messages, speakerColor: kChorusColor)));
    expect(find.text(messages[0]), findsOneWidget);
  });

  testWidgets('Verify multiple messages displayed', (tester) async {
    const messages = [
      'short message',
      'big message\big message\big message\big message\nbig message',
    ];
    await tester.pumpWidget(MaterialApp(
        home: TranscriptElementWidget(
            speaker: 'speaker',
            messages: messages,
            speakerColor: kChorusColor)));
    expect(find.text(messages[0]), findsOneWidget);
    expect(find.text(messages[1]), findsOneWidget);
  });
}
