import 'package:flutter/material.dart';
import 'package:voting_system/widgets/members.dart';

class MembersScreen extends StatelessWidget {
  MembersScreen({super.key});

  List<Map<String, String>> integrantes = [
    {
      "picture": "assets/members/julio.png",
      "name": "Julio Aceituno Zelaya",
      "role": "Documentador y programador",
      "description": "Experto en dejar todo para útilma hora.",
      "github": "@jaceitunoz"
    },
    {
      "picture": "assets/members/enrique.png",
      "name": "Enrique Villalobos Andrade",
      "role": "Programador",
      "description": "Perteneciente a la iglesia de linux.\nHater de windows.",
      "github": "@yowls"
    },
    {
      "picture": "assets/members/oliver.png",
      "name": "Oliver Chacon Alvarez",
      "role": "Documentador y desarrollador",
      "description": "Cazador de sueños y profugo nocturno.",
      "github": "@olivertravian"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff00417c),
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffedf2f4)
                  ),
                ),
                SizedBox(width: 30,),
                const Text(
                  "Integrantes",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffedf2f4),
                    fontSize: 24,
                    decoration: TextDecoration.underline,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 40,),
          Container(
            width: 330,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Members(member: integrantes[0]),
                Members(member: integrantes[1]),
                Members(member: integrantes[2]),
              ],
            ),
          )
        ],
      ),
    );
  }
}