import 'package:chorus/bloc/player_bloc.dart';
import 'package:chorus/global/constants.dart';
import 'package:chorus/global/global_translations.dart';
import 'package:chorus/model/chat_element.dart';
import 'package:chorus/widget/screen_base_widget.dart';
import 'package:chorus/widget/transcript_element_widget.dart';
import 'package:chorus/widget/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chorus/global/strings.dart' as strings;

class PlayerScreen extends StatelessWidget {
  final String contentId;

  const PlayerScreen({this.contentId});

  @override
  Widget build(BuildContext context) {
    return Provider<PlayerBloc>(
      create: (context) => PlayerBloc(contentId),
      dispose: (context, bloc) => bloc.dispose(),
      child: Scaffold(
        body: ScreenBaseWidget(
          child: Consumer<PlayerBloc>(
            builder: (context, playerBloc, _) {
              return Column(
                children: <Widget>[
                  const SizedBox(height: 42),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 34,
                      right: 23,
                    ),
                    child: Text(
                      //title text probably should be received from api
                      'Moment from meeting with Two Pillars',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 34,
                      right: 23,
                      top: 9,
                    ),
                    child: StreamBuilder<VideoPlayerController>(
                      stream: playerBloc.videoControllerStream,
                      builder: (context, snapshot) {
                        return !snapshot.hasError
                            ? AspectRatio(
                                aspectRatio: snapshot.hasData
                                    ? _calculateRatioForOrientation(context,
                                        ratio: snapshot.data.value.aspectRatio)
                                    : _calculateRatioForOrientation(context),
                                child: snapshot.hasData
                                    ? VideoPlayerWidget(
                                        videoPlayerController: snapshot.data)
                                    : const Center(
                                        child: CircularProgressIndicator()),
                              )
                            : Text(
                                translations.string(strings.playerError),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: kErrorColor,
                                ),
                                textAlign: TextAlign.center,
                              );
                      },
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<ChatElement>>(
                      stream: playerBloc.transcriptStream,
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 13)
                                        .copyWith(bottom: 53, top: 23),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 30),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  final chatElement = snapshot.data[index];
                                  return TranscriptElementWidget(
                                    speaker: chatElement.speaker,
                                    messages: chatElement.messages,
                                    speakerColor:
                                        chatElement.speaker == kRepSpeaker
                                            ? kSpeakerRepColor
                                            : kSpeakerCustColor,
                                  );
                                },
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// Calculates aspect ratio for video player depending
  /// on the screen proportions
  double _calculateRatioForOrientation(BuildContext context, {double ratio}) =>
      (ratio ?? 16 / 9) * (MediaQuery.of(context).size.aspectRatio > 1 ? 2 : 1);
}
