import 'package:chorus/api/api_manager.dart';
import 'package:chorus/model/transcript.dart';
import 'package:test/test.dart';

void main() {
  group('Api', () {
    test('Verify api doesnt throw an exception for a bad gateway', () async {
      final List result = await ApiManager().loadTranscript('notExistingId');
      expect(result.length, 0);
    });

    test('Verify correct transcript json parsing', () async {
      const simpleJson = '''
    [{
        "snippet": "Mm-hmm",
        "speaker": "Cust",
        "time": 1.92
    },
    {
        "snippet": "Hello?",
        "speaker": "Rep",
        "time": 3.66
    }]''';
      final List<Transcript> result =
          ApiManager.parseTranscriptJson(simpleJson);

      expect(result.length, 2);
      expect(result[0].speaker, 'Cust');
      expect(result[0].snippet, 'Mm-hmm');
      expect(result[1].speaker, 'Rep');
      expect(result[1].snippet, 'Hello?');
    });

    test('Verify parser return empty list for broken json', () async {
      const brokenJson = 'brokenJson';
      final List<Transcript> result =
          ApiManager.parseTranscriptJson(brokenJson);
      expect(result.isEmpty, true);
    });
  });
}
