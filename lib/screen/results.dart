import 'package:flutter/material.dart';
import 'package:voting_system/model/result.dart';
import 'package:voting_system/service/voter.dart';

class ResultsScreen extends StatelessWidget {
  final String pollToken;

  const ResultsScreen({super.key, required this.pollToken});

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
                const SizedBox(width: 30,),
                const Text(
                  "Revisa los resultados",
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
          FutureBuilder<PollResult> (
              future: VoterService.getResult(pollToken),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const CircularProgressIndicator()
                    : Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 330,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              snapshot.data?.name ?? "unknown",
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
                            "Resultados",
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
                      width: 370,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(snapshot.data!.results.length, (index) {
                                return Container(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:[
                                      Container(
                                        width: 230,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0xffedf2f4),
                                        ),
                                        padding: const EdgeInsets.all(20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[
                                            Expanded(
                                              child: SizedBox(
                                                child: Text(
                                                  snapshot.data?.results[index].choice ?? "title unknown",
                                                  style: const TextStyle(
                                                    color: Color(0xff22223b),
                                                    fontSize: 14,
                                                    fontFamily: "Inter",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0xff009850),
                                        ),
                                        padding: const EdgeInsets.symmetric(vertical: 10, ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children:[
                                            Text(
                                              snapshot.data?.results[index].total ?? "??",
                                              style: const TextStyle(
                                                color: Color(0xffedf2f4),
                                                fontSize: 12,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              "Votos",
                                              style: TextStyle(
                                                color: Color(0xffedf2f4),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
          ),
        ],
      ),
    );
  }
}
