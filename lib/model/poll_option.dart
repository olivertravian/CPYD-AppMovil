class PollOption {
  final String selection;
  final String choice;

  const PollOption({required this.selection, required this.choice});

  factory PollOption.fromJSON(Map<String, dynamic> json) {
    return PollOption(
      selection: json['selection'],
      choice: json['choice'],
    );
  }

}