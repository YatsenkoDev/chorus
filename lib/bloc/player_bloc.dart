import 'package:chorus/api/api_manager.dart';
import 'package:chorus/model/chat_element.dart';
import 'package:chorus/model/transcript.dart';
import 'package:chorus/utils/network_utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

class PlayerBloc {
  final ApiManager _apiManager = ApiManager();

  final _videoControllerSubject = BehaviorSubject<VideoPlayerController>();

  Stream<VideoPlayerController> get videoControllerStream =>
      _videoControllerSubject.stream;

  final _transcriptSubject = BehaviorSubject<List<ChatElement>>();

  Stream<List<ChatElement>> get transcriptStream => _transcriptSubject.stream;

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
    final List<Transcript> transcript =
        await _apiManager.loadTranscript(contentId);
    transcript.sort();
    final List<ChatElement> chatElements = [];
    String speakerName;
    List<String> messages;
    for (final Transcript element in transcript) {
      void updateVariables() {
        speakerName = element.speaker;
        messages = [element.snippet];
      }

      if (speakerName == null) {
        updateVariables();
      } else if (speakerName != element.speaker) {
        chatElements.add(ChatElement(speakerName, messages));
        updateVariables();
      } else {
        messages.add(element.snippet);
      }
    }
    _transcriptSubject.add(chatElements);
  }

  void _onPlayerStatusChanged() {
    if (_controller?.value?.hasError ?? false) {
      _videoControllerSubject.addError(true);
    }
  }

  void dispose() {
    _videoControllerSubject.close();
    _transcriptSubject.close();
    _controller.dispose();
  }
}
