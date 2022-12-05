import 'package:flutter/material.dart';

class PollsScreen extends StatelessWidget {
  const PollsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff00417c),
      padding: const EdgeInsets.symmetric(vertical: 50, ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Image.asset('assets/back.png')
                ),
                const SizedBox(width: 30,),
                const Text(
                  "Encuestas",
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
            )
          ),
          const SizedBox(height: 40,),
          Container(
            width: 330,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Titulo votacion1",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
