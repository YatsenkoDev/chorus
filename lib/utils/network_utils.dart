class NetworkUtils {
  static const String _videoUrlPrefix = 'https://static.chorus.ai/api/';
  static const String _videoUrlPostfix = '.mp4';

  static String buildVideoUrl(String id) =>
      _videoUrlPrefix + id + _videoUrlPostfix;
}
