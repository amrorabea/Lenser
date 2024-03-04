import 'package:flutter/material.dart';
import 'containers.dart';

void main() {
  runApp(const MyApp());
}

const Color backGround = Color.fromRGBO(41, 41, 41, 1);
const Color buttonColor = Color.fromRGBO(0, 198, 186, 1);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGround,
        body: Column(
          children: [
            const SizedBox(
              height: 230,
              child: Stack(
                children: [
                  Positioned(
                    top: 1,
                    right: 270,
                    child: CircleContainer(
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Positioned(
                    top: -50,
                    right: 200,
                    child: CircleContainer(
                      height: 150,
                      width: 150,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Know what you are looking for",
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'SemiBold',
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Lenser",
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Black',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Not sure how to describe what you see\n                          in words?\n     Use your camera to detect it and\nsearch for it using AI & Google Gemini!",
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'SemiBold',
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {}, // takes us to the home page
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 50),
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 120,
              child: Stack(
                children: [
                  Positioned(
                    bottom: -100,
                    right: -40,
                    child: CircleContainer(
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    right: -100,
                    child: CircleContainer(
                      height: 150,
                      width: 150,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
