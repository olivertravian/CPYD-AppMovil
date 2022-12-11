import 'package:voting_system/model/result_choices.dart';

class PollResult {
  final String name;
  final List<PollResults > results;

  const PollResult({required this.name, required this.results});

  static PollResult fromJSON(Map<String, dynamic> json) {
    List<PollResults> res = [];

    for (var i = 0; i< json['results'].length; i++) {
      res.add(PollResults.fromJSON(json['results']));
    }

    return PollResult(
        name: json['name'],
        results: res,
    );
  }
}