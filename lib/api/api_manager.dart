import 'dart:convert';

import 'package:chorus/model/transcript.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:chorus/utils/network_utils.dart';

class ApiManager {
  Future<List<Transcript>> loadTranscript(String contentId) async {
    final response = await http.get(NetworkUtils.buildTranscriptUrl(contentId));
    if (response.statusCode == 200) {
      return compute(parseTranscriptJson, response.body);
    } else {
      return const [];
    }
  }

  @visibleForTesting
  static List<Transcript> parseTranscriptJson(String json) {
    try {
      final Iterable transcriptList = jsonDecode(json);
      return transcriptList != null
          ? transcriptList
              .map((element) => Transcript.fromJson(element))
              .toList()
          : const [];
    } catch (e) {
      return const [];
    }
  }
}
