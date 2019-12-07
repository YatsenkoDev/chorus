import 'package:chorus/global/constants.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  const VideoPlayerWidget({this.videoPlayerController});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  final playButtonSize = 35.0;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onStatusChanged,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          VideoPlayer(widget.videoPlayerController),
          if (!isPlaying)
            Container(
              height: playButtonSize,
              width: playButtonSize,
              decoration: BoxDecoration(
                color: kPlayButtonColor,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Icon(
                Icons.play_arrow,
                size: playButtonSize / 1.5,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  void onStatusChanged() {
    if (isPlaying) {
      widget.videoPlayerController.pause();
    } else {
      widget.videoPlayerController.play();
    }
    setState(() => isPlaying = !isPlaying);
  }
}
