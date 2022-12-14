import 'package:flutter/material.dart';
import 'package:voting_system/service/voter.dart';
import 'package:voting_system/model/poll.dart';
import 'package:voting_system/screen/vote.dart';
import 'package:voting_system/screen/results.dart';

class PollsScreen extends StatelessWidget {
  late Future<List<Poll>> polls;

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
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<List<Poll>> (
                  future: VoterService.getPolls(),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const CircularProgressIndicator()
                        : Column(
                      children: List.generate(snapshot.data!.length, (index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                snapshot.data?[index].name ?? "unknown",
                                style: const TextStyle(
                                    color: Color(0xffedf2f4),
                                    fontSize: 20,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500
                                ),
                              )
                            ),
                            const SizedBox(height: 15),
                            Text(
                              snapshot.data?[index].active ?? "unknown",
                              style: const TextStyle(
                                  color: Color(0xffedf2f4),
                                  fontSize: 10,
                                  fontFamily: "Inter",
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xff009850)
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 18,
                                          height: 18,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Image.asset('assets/vote.png'),
                                        ),
                                        const SizedBox(width: 10,),
                                        const Text(
                                          "Ir a votar",
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
                                ],
                              ),
                            ),
                            // borrar desde aqui para abajo
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xff009850)
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: TextButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ResultsScreen(
                                          pollToken: snapshot.data?[index].token ?? "unknown"
                                        ))
                                      ),
                                      child: TextButton( // TODO: check if is active
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => VoteScreen(
                                                pollToken: snapshot.data?[index].token ?? "unknown",
                                                pollTitle: snapshot.data?[index].name ?? "unknown",
                                                pollOptions: snapshot.data?[index].options ?? [],
                                              ))
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8)
                                                ),
                                                child: Image.asset('assets/vote.png'),
                                              ),
                                              const SizedBox(width: 10,),
                                              const Text(
                                                "Ir a votar",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xffedf2f4),
                                                    fontSize: 14,
                                                    fontFamily: "Inter",
                                                    fontWeight: FontWeight.w700
                                                ),
                                              )
                                            ],
                                          )
                                      ),
                                    )
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xff009850)
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 18,
                                          height: 18,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Image.asset('assets/results.png'),
                                        ),
                                        const SizedBox(width: 10,),
                                        const Text(
                                          "Ver resultados",
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
                                ],
                              ),
                            )
                          ],
                        );
                      }),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
