import 'package:chorus/bloc/player_bloc.dart';
import 'package:chorus/widget/screen_base_widget.dart';
import 'package:chorus/widget/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

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
                        return AspectRatio(
                          aspectRatio: snapshot.hasData
                              ? snapshot.data.value.aspectRatio
                              : 16 / 9,
                          child: snapshot.hasData
                              ? VideoPlayerWidget(
                                  videoPlayerController: snapshot.data)
                              : const Center(
                                  child: CircularProgressIndicator()),
                        );
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
}
