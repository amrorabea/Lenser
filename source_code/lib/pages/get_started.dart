import 'package:flutter/material.dart';
import 'package:source_code/components/containers.dart';
import 'package:source_code/pages/second.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGround,
        body: Column(
          children: [
            const SizedBox(height: 100),
            const Image(
              image: AssetImage('images/objects.png'),
              height: 130,
            ),
            const Spacer(),
            text(
              txt: "Know what you are looking for",
              size: 23,
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
                  gradient: LinearGradient(colors: [
                    circles,
                    Colors.white,
                  ]),
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                text(
                    txt: "enser",
                    size: 50,
                    weight: FontWeight.bold,
                    color: fontColor),
              ],
            ),
            const Spacer(),
            const SizedBox(height: 30),
            text(
                txt:
                    "Not sure how to describe what you see\nin words?\nUse your camera to detect it and\nsearch for it using AI & Google Gemini!",
                size: 15,
                weight: FontWeight.normal,
                color: fontColor),
            const Spacer(),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Second(),
                  ),
                );
              }, // takes us to the home page
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 50),
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: text(
                  txt: "Get Started",
                  size: 20,
                  weight: FontWeight.normal,
                  color: Colors.white),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
