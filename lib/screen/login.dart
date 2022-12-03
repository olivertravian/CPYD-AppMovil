import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:voting_system/service/voter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: SizedBox(
              height: 50,
              child: SignInButton(
                Buttons.Google,
                elevation: 5,
                text: 'Login UTEM',
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () => VoterService.login(context),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
