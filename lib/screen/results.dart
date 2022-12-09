import 'package:flutter/material.dart';
import 'package:voting_system/model/poll_option.dart';

class ResultsScreen extends StatelessWidget {
  final String pollTitle;
  final List<PollOption> pollOptions;

  const ResultsScreen({super.key, required this.pollTitle, required this.pollOptions});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff00417c),
      padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 30 ),
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
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: Image.asset('assets/back.png'),
                    )
                ),
                const SizedBox(width: 30,),
                const Text(
                  "Realizar votación",
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
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    pollTitle,
                    style: const TextStyle(
                      color: Color(0xffedf2f4),
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  "Opciones",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffedf2f4),
                    fontSize: 10,
                    fontStyle: FontStyle.italic
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 40,),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    pollOptions.length,
                      (index){
                        return Column(
                          children: [
                            Container(
                              width: 330,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffedf2f4)
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                        child: Text(
                                          "${pollOptions[index].selection}. ${pollOptions[index].choice}",
                                          style: const TextStyle(
                                              color: Color(0xff22223b),
                                              fontSize: 14,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,)
                          ],
                        );
                      }
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
