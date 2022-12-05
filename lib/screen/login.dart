import 'package:flutter/material.dart';
import 'package:voting_system/service/voter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff00417c),
      padding: const EdgeInsets.symmetric(vertical: 20, ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 421,
                height: 422,
                child: Image.asset('assets/voting_system.png'),
              )
            ],
          ),
          const SizedBox(height: 70,),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Sistema de votación",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffedf2f4),
                  fontSize: 32,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Inicio de sesión",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffedf2f4),
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: 300,
                child: Text(
                  "Accede con tu correo UTEM para validar que eres parte de la organización",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 50,),
          TextButton(
              onPressed: () => VoterService.login(context),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xcc009850)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Image.asset('assets/google.png'),
                    ),
                    const SizedBox(width: 20,),
                    const Text(
                      "Inicia con google",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffedf2f4),
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
