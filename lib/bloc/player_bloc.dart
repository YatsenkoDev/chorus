import 'package:chorus/utils/network_utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

class PlayerBloc {
  final String contentId;

  final _videoControllerSubject = BehaviorSubject<VideoPlayerController>();

  Stream<VideoPlayerController> get videoControllerStream =>
      _videoControllerSubject.stream;

  VideoPlayerController _controller;

  PlayerBloc(this.contentId) {
    _controller =
        VideoPlayerController.network(NetworkUtils.buildVideoUrl(contentId))
          ..setLooping(true)
          ..initialize().then((_) {
            if (!_videoControllerSubject.isClosed) {
              _videoControllerSubject.add(_controller);
            }
          });
  }

  void dispose() {
    _videoControllerSubject.close();
    _controller.dispose();
  }
}
