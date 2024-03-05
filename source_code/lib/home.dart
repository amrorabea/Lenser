import 'package:flutter/material.dart';
import 'package:source_code/Additional%20Files/colors.dart';
import 'package:source_code/Additional%20Files/containers.dart';
import 'package:source_code/chatbot.dart';
import 'package:source_code/object_detection.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _LoginState();
}

double wid = 90;
int counter = 0;
const double lenser = 35;

class _LoginState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGround,
        appBar: const appBAR(),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                    child: Stack(
                      children: [
                        Positioned(
                          top: -50,
                          right: 290,
                          child: CircleContainer(
                            height: 150,
                            width: 150,
                          ),
                        ),
                        Positioned(
                          top: -85,
                          right: 220,
                          child: CircleContainer(
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Welcome to",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const Text(
                    "𝕝𝕖𝕟𝕤𝕖𝕣,",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: lenser,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "USERNAME",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const Text(
                    "We start from here",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "𝕝𝕖𝕟𝕤𝕖𝕣",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: lenser,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " is an app that is",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                  const Text(
                    "designed to help you",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const Text(
                    "understand what your",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const Text(
                    "camera is recording using:",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ),
                  // ======================================================
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Object Detection",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "AI model trained with",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              "Deep Learning to detect",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              "objects recorded by",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              "camera",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage('images/camera.png'),
                          width: 120,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ObjectDetection(),
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
                    child: const Text(
                      "Try it",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  // =====================================
                  const SizedBox(height: 30),
                  const Text(
                    "Additional Features",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Gemini API",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "with the help of",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "Gemini,",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "you can now send the",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "image to Gemini, and it",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "will response to you",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "with additional info on",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "the detected objects!",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      Image(
                        image: AssetImage('images/bot.png'),
                        width: 150,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const chatBot(),
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
                    child: const Text(
                      "Try Gemini's API",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
