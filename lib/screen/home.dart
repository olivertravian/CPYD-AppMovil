import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: const Color(0xff00417c),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: const FlutterLogo(size: 100,),
                  ),
                  const SizedBox(width: 15,),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Arturo vidal",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffedf2f4),
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Estudiante",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontStyle: FontStyle.italic
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 60,),
            const Text(
              "Menu principal",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffedf2f4),
                fontSize: 24,
                decoration: TextDecoration.underline,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 60,),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff009850)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                        child: const FlutterLogo(size: 18,),
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        "Ver encuestas",
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
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffedf2f4)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                        child: const FlutterLogo(size: 18,),
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        "Ver Resultados",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff22223b),
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
