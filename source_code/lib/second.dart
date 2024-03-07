import 'package:flutter/material.dart';
import 'package:source_code/Additional%20Files/colors.dart';
import 'package:source_code/Additional%20Files/containers.dart';
import 'package:source_code/home.dart';

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
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                    ),
                    child: const Icon(
                      Icons.exit_to_app,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              "Welcome back,",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: fontColor,
              ),
            ),
            const Text(
              "USERNAME !",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: fontColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "We start from here",
              style: TextStyle(
                fontSize: 25,
                color: fontColor,
              ),
            ),
            const Spacer(),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientText(
                  text: "L",
                  gradient: LinearGradient(colors: [
                    circles,
                    Colors.white,
                  ]),
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  "enser",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: fontColor,
                  ),
                ),
                Text(
                  " is an app",
                  style: TextStyle(
                    fontSize: 35,
                    color: fontColor,
                  ),
                ),
              ],
            ),
            const Text(
              "that is designed to\nhelp you\nunderstand what\nyour camera is\nrecording using",
              style: TextStyle(
                fontSize: 35,
                color: fontColor,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
