class PollOption {
  final String selection;
  final String choice;

  const PollOption({required this.selection, required this.choice});

  static PollOption fromJSON(Map<String, dynamic> json) {

    var opt = PollOption(
      selection: json['selection'].toString(),
      choice: json['choice'].toString(),
    );

    return opt;
  }

}