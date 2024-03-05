import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:source_code/about.dart';
import 'package:source_code/Additional%20Files/colors.dart';
import 'package:source_code/Additional%20Files/containers.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _LoginState();
}

double wid = 90;
int counter = 0;

class _LoginState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGround,
        appBar: appBAR(),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
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
                    "welcom to",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const Text(
                    "𝕝𝕖𝕟𝕤𝕖𝕣,",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const Text(
                    "username",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const Text(
                    "we  start  from  here",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  const Text(
                    "𝕝𝕖𝕟𝕤𝕖𝕣 is an app that is  ",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const Text(
                    "desingand to help you",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const Text(
                    "understand what your",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const Text(
                    "camera is recording using",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  //Spacer(),
                  const Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "object detection",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            "ai model trained withe",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "deep learning to detect",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            " objects recorder by ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "camera",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      Image(
                        image: AssetImage('images/camera.png'),
                        width: 100,
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
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
                      "try it",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "gemini api",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            "wtih the help of",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "gemini,",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            " you can now send the ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "image to gmini, and it",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "will response to you",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "with additional info on ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "the detected objects!",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      Image(
                        image: AssetImage('images/camera.png'),
                        width: 100,
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
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
                      "try gemini's api",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
