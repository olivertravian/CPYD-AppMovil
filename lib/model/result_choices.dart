class PollResults {
  final String choice;
  final String total;

  const PollResults({required this.choice, required this.total});

  static PollResults fromJSON(Map<String, dynamic> json) {

    return PollResults(
      choice: json['choice'].toString(),
      total: json['total'].toString(),
    );
  }

}