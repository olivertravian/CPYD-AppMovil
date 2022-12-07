import 'package:flutter/material.dart';
import 'package:voting_system/service/voter.dart';
import 'package:voting_system/model/poll.dart';
import 'package:voting_system/screen/home.dart';

class PollsScreen extends StatelessWidget {
  late Future<List<Poll>> polls;

  PollsScreen({super.key}) {
    // polls = ;
  }

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
                        print(snapshot.data?[index].name);
                        return Text(snapshot.data?[index].name ?? "aa");
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
