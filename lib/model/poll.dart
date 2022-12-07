import 'package:voting_system/model/poll_option.dart';

class Poll {
  final String name;
  final String token;
  final List<PollOption> options;
  final String active;

  const Poll({required this.name, required this.token, required this.options, required this.active });

  static Poll fromJSON(Map<String, dynamic> json) {
    List<PollOption> options = [];

    for (var i = 0; i< json['options'].length; i++) {
      options.add(PollOption.fromJSON(json['options'][i]));
    }

    var activeText = "Inactivo";
    if (json['active']) {
      activeText = "Activo";
    }

    return Poll(
        name: json['name'],
        token: json['token'],
        options: options,
        active: activeText
    );
  }
}