import 'package:flutter/material.dart';
import 'package:voting_system/model/poll_option.dart';

class ResultsScreen extends StatefulWidget {
  final String pollToken;
  final String pollTitle;
  final List<PollOption> pollOptions;

  const ResultsScreen({super.key, required this.pollToken , required this.pollTitle, required this.pollOptions});

  @override
  State<ResultsScreen> createState() => _ResultsState();
}

class _ResultsState extends State<ResultsScreen> {
  List<bool> buttonColor = [true,true,true];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff00417c),
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
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
                const SizedBox(width: 20,),
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
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.pollTitle,
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
          SizedBox(
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
                    widget.pollOptions.length,
                    (index) {
                      return Column(
                        children: [
                          Container(
                            width: 330,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: (buttonColor[index] == false) ? const Color(0xff009850) : const Color(0xffedf2f4)
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: SizedBox(
                                      child: ElevatedButton(
                                        onPressed: (){
                                          setState(() {
                                            for (var i=0; i<buttonColor.length; i++) {
                                              if (i == index) {
                                                buttonColor[index] = false;
                                              }
                                              else {
                                                buttonColor[i] = true;
                                              }
                                            }
                                          });
                                        },
                                        child: Text(
                                          "${widget.pollOptions[index].selection}. ${widget.pollOptions[index].choice}",
                                          style: TextStyle(
                                              color: (buttonColor[index] == false) ? const Color(0xffedf2f4) : const Color(0xff22223b),
                                              fontSize: 14,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w600
                                          ),
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
