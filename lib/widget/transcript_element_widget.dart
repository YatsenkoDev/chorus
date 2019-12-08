import 'package:chorus/global/constants.dart';
import 'package:flutter/material.dart';

class TranscriptElementWidget extends StatelessWidget {
  final String speaker;
  final List<String> messages;
  final Color speakerColor;

  const TranscriptElementWidget({
    this.speaker,
    this.messages,
    this.speakerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _Avatar(
          color: speakerColor,
        ),
        const SizedBox(width: 7),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(speaker),
              const SizedBox(height: 9),
              for (int i = 0; i < messages.length; i++)
                Padding(
                  padding: EdgeInsets.only(
                      bottom: i != messages.length - 1 ? 14 : 0),
                  child: _Message(text: messages[i]),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  final avatarSize = 24.0;
  final Color color;

  const _Avatar({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        shape: BoxShape.circle,
        border: Border.all(color: color),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  final String text;

  const _Message({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kBaseBackgroundColor,
      ),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 13,
        bottom: 9,
      ),
      child: Text(text),
    );
  }
}
