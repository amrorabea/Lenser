import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:source_code/components/containers.dart';
import 'package:source_code/pages/chatbot.dart';
import 'package:source_code/pages/object_detection.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

double wid = 90;
int counter = 0;
const double lenser = 35;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const appBAR(),
      extendBodyBehindAppBar: true,
      body:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                ),
                // ======================================================
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Object Detection",
                            style: TextStyle(
                                fontSize: 30,
                                height: 2,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " AI model trained with deep \n learning to detect objects \n recorder by camera",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage('images/camera.png'),
                          width: 130,
                          height: 160,
                        ),
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
                    fixedSize: const Size(200, 60),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Try it !",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                // =====================================
                const SizedBox(height: 30),
                const Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Text(
                          "     And     ",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                      ],
                    )),
                //==================================
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Gemini API",
                            style: TextStyle(
                                fontSize: 30,
                                height: 2,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              " With the help of\n Gemini,\n You can now send the\n image to Gemini, and it\n will response to you\n with additional info on\n the detected objects ",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Image(
                        image: AssetImage('images/bot.png'),
                        width: 180,
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
                        builder: (context) => const ChatBot(),
                      ),
                    );
                  }, // takes us to the home page
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(227, 60),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Try Gemini's API !",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      }),
    );
  }
}
