import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:source_code/components/containers.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const appBAR(),
      extendBodyBehindAppBar: true,
      body: Consumer<UiProvider>(
        builder: (context, UiProvider notifier, child) {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    // About us
                    'About us',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: sizeCategories),
                  ),
                  Padding(
                      // Lenser with gradient L
                      padding: EdgeInsets.only(left: 25, top: 10),
                      child: Row(children: [
                        GradientText(
                            text: "L",
                            gradient: LinearGradient(
                                colors: [buttonColor, Colors.black]),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold)),
                        text(txt: "enser", size: 50, weight: FontWeight.bold),
                      ])),
                  SizedBox(height: 15),
                  text(
                      txt:
                          "This project was created by\nModern Academy students\nand used programming\n languages (Flutter, Python)\nand the help of artificial\nintelligence which\nparticipated in it :",
                      size: 24,
                      weight: FontWeight.normal,
                      align: TextAlign.center),
                  // ============
                  // Participants
                  text(
                      txt: "Ahmed Wael",
                      size: sizeWorkers,
                      weight: FontWeight.bold),
                  SizedBox(height: 10),
                  text(
                      txt: "Mahmoud Reda",
                      size: sizeWorkers,
                      weight: FontWeight.bold),
                  SizedBox(height: 10),
                  text(
                      txt: "Seif Ezz",
                      size: sizeWorkers,
                      weight: FontWeight.bold),
                  SizedBox(height: 10),
                  text(
                      txt: "Amro Rabea",
                      size: sizeWorkers,
                      weight: FontWeight.bold),
                  Padding(
                    // Divider
                    padding: EdgeInsets.only(left: 0, right: 0, top: 50),
                    child: Divider(thickness: 2),
                  ),
                  SizedBox(height: 10),
                  text(
                      txt: "For contact",
                      size: sizeTitles,
                      weight: FontWeight.normal),
                  // ============
                  // Contact Logos and links
                  Row(
                    children: [
                      Spacer(),
                      contacts(
                          imageUrl: 'images/gmail.png',
                          siteLink: "lenser5app@gmail.com",
                          txt: "Gmail"),
                      Spacer(),
                      contacts(
                          imageUrl: 'images/facebook.png',
                          siteLink: "https://google.com",
                          txt: "Facebook"),
                      Spacer(),
                      contacts(
                          imageUrl: 'images/twitter.png',
                          siteLink: "https://google.com",
                          txt: "Twitter"),
                      Spacer(),
                      contacts(
                          imageUrl: 'images/github.png',
                          siteLink: "https://google.com",
                          txt: "GitHub"),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
