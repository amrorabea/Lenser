import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:source_code/components/containers.dart';
import 'package:source_code/pages/Chatbot/chatbot.dart';
import 'package:source_code/pages/object_detection.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

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
            padding: const EdgeInsets.only(top: 85),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                ),
                // ======================================================
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          text(
                            txt: "Object Detection",
                            size: 30,
                            height: 2,
                            weight: FontWeight.bold,
                          ),
                          text(
                            txt:
                                " AI model trained with deep \n learning to detect objects \n recorder by camera",
                            size: 18,
                          ),
                        ],
                      ),
                      const Padding(
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
                  child: text(txt: "Try it !", size: 22),
                ),
                // =====================================
                const SizedBox(height: 30),
                Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: text(txt: 'And', size: 18),
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                      ],
                    )),
                //==================================
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          text(
                            txt: "Gemini API",
                            size: 30,
                            weight: FontWeight.bold,
                            height: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: text(
                                txt:
                                    " With the help of\n Gemini,\n You can now send the\n image to Gemini, and it\n will response to you\n with additional info on\n the detected objects",
                                size: 18,
                                weight: FontWeight.normal),
                          ),
                        ],
                      ),
                      // const Image(
                      //   image: AssetImage('images/bot.png'),
                      //   width: 180,
                      // )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    var collection =
                        FirebaseFirestore.instance.collection('messages');
                    var snapshots = await collection.get();
                    for (var doc in snapshots.docs) {
                      await doc.reference.delete();
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatBot(),
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
                  child: text(
                    txt: "Try Gemini's API !",
                    size: 22,
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
