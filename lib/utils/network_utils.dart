class NetworkUtils {
  static const String _chorusUrlPrefix = 'https://static.chorus.ai/api/';
  static const String _videoUrlPostfix = '.mp4';
  static const String _transcriptUrlPostfix = '.json';

  static String buildVideoUrl(String id) =>
      _chorusUrlPrefix + id + _videoUrlPostfix;

  static String buildTranscriptUrl(String id) =>
      _chorusUrlPrefix + id + _transcriptUrlPostfix;
}
