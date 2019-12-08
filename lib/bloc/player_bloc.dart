import 'package:chorus/api/api_manager.dart';
import 'package:chorus/model/transcript.dart';
import 'package:chorus/utils/network_utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

class PlayerBloc {

  final ApiManager _apiManager = ApiManager();

  final _videoControllerSubject = BehaviorSubject<VideoPlayerController>();

  Stream<VideoPlayerController> get videoControllerStream =>
      _videoControllerSubject.stream;

  VideoPlayerController _controller;

  PlayerBloc(String contentId) {
    _controller =
        VideoPlayerController.network(NetworkUtils.buildVideoUrl(contentId))
          ..setLooping(true)
          ..addListener(_onPlayerStatusChanged)
          ..initialize().then((_) {
            if (!_videoControllerSubject.isClosed) {
              _videoControllerSubject.add(_controller);
            }
          });
    _loadTranscript(contentId);
  }

  void _loadTranscript(String contentId) async {
    List<Transcript> transcript = await _apiManager.loadTranscript(contentId);
  }

  void _onPlayerStatusChanged() {
    if (_controller?.value?.hasError ?? false) {
      _videoControllerSubject.addError(true);
    }
  }

  void dispose() {
    _videoControllerSubject.close();
    _controller.dispose();
  }
}
