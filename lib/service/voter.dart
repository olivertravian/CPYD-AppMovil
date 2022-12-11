import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:voting_system/screen/authorization.dart';
import 'package:voting_system/service/secure_storage.dart';
import 'package:voting_system/model/poll.dart';
import 'package:voting_system/model/result.dart';
import 'package:voting_system/model/result_choices.dart';

class VoterService {
  static const String _host = "https://api.sebastian.cl";
  static const String _apiTkn = "sebastian.cl";
  static const String _apiKey = "aaa-bbb-ccc-ddd";
  static const String _mime = "application/json";

  static Future<bool> login(BuildContext context) async {
    Uri uri = Uri.parse('$_host/vote/v1/auth/login');
    Map<String, String> headers = {
      'accept': _mime,
      'Content-Type': _mime,
      'X-API-TOKEN': _apiTkn,
      'X-API-KEY': _apiKey
    };

    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      final String token = result['token'];
      final String redirectUrl = result['redirectUrl'];
      if (redirectUrl.isNotEmpty) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AuthorizationScreen(url: redirectUrl, token: token),
            ));
      }
    }
    return false;
  }

  static Future<String> getJwt(String token) async {
    Uri uri = Uri.parse('$_host/vote/v1/auth/$token/jwt');
    Map<String, String> headers = {
      'accept': _mime,
      'Content-Type': _mime,
      'X-API-TOKEN': _apiTkn,
      'X-API-KEY': _apiKey
    };

    String jwt = "";
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      jwt = result['jwt'];
    }
    return jwt;
  }

  static Future<List<Poll>> getPolls() async {
    final String token = await UserSecureStorage.getJwt() ?? "";

    Uri uri = Uri.parse('$_host/vote/v1/voter/polls');
    Map<String, String> headers = {
      'accept': _mime,
      'Content-Type': _mime,
      'Authorization': token,
    };

    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var result = json.decode(utf8.decode(response.bodyBytes));

      List<Poll> polls = List.filled(
          result.length,
          const Poll(
              name: "",
              token: "",
              options: [],
              active: ""
          )
      );

      for (var i = 0; i< result.length; i++) {
        polls[i] = Poll.fromJSON(result[i]);
      }
      return polls;

    }

    return [];
  }

  static Future<PollResult> getResult(String pollToken) async {
    final String userToken = await UserSecureStorage.getJwt() ?? "";

    Uri uri = Uri.parse('$_host/vote/v1/$pollToken/results');
    Map<String, String> headers = {
      'accept': _mime,
      'Content-Type': _mime,
      'Authorization': userToken,
    };

    String name = "";
    List<PollResults> pollResults = [];

    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var result = json.decode(utf8.decode(response.bodyBytes));

      print(result);

      name = result['name'];
      List<PollResults> res = result['results'];

     for (var i=0; i< res.length; i++) {
       pollResults.add(PollResults(choice: res[i].choice, total: res[i].total));
     }
    }

    return PollResult(name: name, results: pollResults);
  }

  static Future<int> vote(String pollToken, String selection) async {
    final String userToken = await UserSecureStorage.getJwt() ?? "";

    Uri uri = Uri.parse('$_host/vote/v1/voter/vote');
    Map<String, String> headers = {
      'accept': _mime,
      'Content-Type': _mime,
      'Authorization': userToken,
    };
    Map<String, String> body = {
      'pollToken': pollToken,
      'selection': selection // TODO: test if accept this as string
    };

    final response = await http.post(uri, headers: headers, body: jsonEncode(body));

    return response.statusCode;
  }
}
