import 'package:chorus/widget/screen_base_widget.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  final String contentId;

  const PlayerScreen({this.contentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBaseWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              contentId,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
