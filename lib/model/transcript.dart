class Transcript implements Comparable<Transcript> {
  final String snippet;
  final String speaker;
  final double time;

  Transcript.fromJson(Map<String, dynamic> json)
      : snippet = json['snippet'],
        speaker = json['speaker'],
        time = json['time'];

  @override
  int compareTo(Transcript other) => other.time < time ? -1 : 1;
}
