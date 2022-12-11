import 'package:flutter/material.dart';

class Members extends StatelessWidget {
  final Map<String, String> member;

  const Members({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 10,),
        Container(
          width: 79,
          height: 79,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8)
          ),
          child: Image.asset(member['picture'] ?? "assets/user.png"),
        ),
        const SizedBox(width: 30,),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member['name'] ?? "unknown",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    member['role'] ?? "unknown",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontStyle: FontStyle.italic
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: Text(
                  member['description'] ?? "unknown",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff22223b)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
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
                      child: Image.asset('assets/github.png'),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      member['github'] ?? "unknown",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12
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
  }
}