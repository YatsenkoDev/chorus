import 'package:chorus/widget/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_player/video_player.dart';

void main() {
  testWidgets('Verify video player displayed', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: VideoPlayerWidget(
            videoPlayerController: VideoPlayerController.network('someurl'))));
    expect(find.byType(VideoPlayer), findsOneWidget);
  });

  testWidgets('Verify play button dissapears', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: VideoPlayerWidget(
            videoPlayerController: VideoPlayerController.network('someurl'))));
    expect(find.byType(Icon), findsOneWidget);
    await tester.tap(find.byType(VideoPlayer));
    await tester.pump();
    expect(find.byType(Icon), findsNothing);
  });
}
