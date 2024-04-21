import 'package:flutter/material.dart';
import 'package:source_code/components/containers.dart';
import 'package:source_code/pages/home.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGround,
        body: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 0, 0, 0)),
                    child: const Icon(Icons.exit_to_app,
                        size: 35, color: Colors.white),
                  ),
                ],
              ),
            ),
            const Spacer(),
            text(
              txt: "Welcome!",
              size: 40,
              weight: FontWeight.bold,
              color: fontColor,
            ),
            const SizedBox(height: 10),
            text(
              txt: "We start from here",
              size: 25,
              weight: FontWeight.normal,
              color: fontColor,
            ),
            const Spacer(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GradientText(
                  text: "L",
                  gradient: LinearGradient(
                    colors: [
                      circles,
                      Colors.white,
                    ],
                  ),
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                text(txt: "enser", size: 50, weight: FontWeight.bold),
                text(
                  txt: " is an app",
                  size: 35,
                  color: fontColor,
                ),
              ],
            ),
            text(
              txt:
                  "that is designed to\nhelp you\nunderstand what\nyour camera is\nrecording using",
              size: 35,
              color: fontColor,
              align: TextAlign.center,
            ),
            const Spacer(),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
