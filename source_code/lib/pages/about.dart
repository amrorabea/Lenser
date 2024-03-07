import 'package:flutter/material.dart';
import 'package:source_code/components/colors.dart';
import 'package:source_code/components/containers.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

const double sizeCategories = 19;
const double sizeTitles = 25;
const double sizeWorkers = 23;
const double paddingDividerLeft = 60;
const double paddingDividerRight = 60;
const double sizeMedia = 15;
const double sizeMediaIcons = 65;

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGround,
        appBar: const appBAR(),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                const SizedBox(height: 12),
                const Text(
                  'About us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: sizeCategories,
                    color: fontColor,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25, top: 10),
                  child: Row(
                    children: [
                      GradientText(
                        text: "L",
                        gradient: LinearGradient(colors: [
                          circles,
                          Colors.white,
                        ]),
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "enser",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: fontColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "This project was created by\nModern Academy students\nand used programming\n languages (Flutter, Python)\nand the help of artificial\nintelligence which\nparticipated in it :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: fontColor,
                  ),
                ),
                const Text(
                  "Ahmed Wael",
                  style: TextStyle(
                    fontSize: sizeWorkers,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 253, 253, 253),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Mahmoud Reda",
                  style: TextStyle(
                    fontSize: sizeWorkers,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Seif Ezz",
                  style: TextStyle(
                    fontSize: sizeWorkers,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Amro Rabea",
                  style: TextStyle(
                    fontSize: sizeWorkers,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Yousef Mohamed",
                  style: TextStyle(
                    fontSize: sizeWorkers,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Hossam Dyab",
                  style: TextStyle(
                    fontSize: sizeWorkers,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: Divider(
                    color: fontColor,
                    thickness: 2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "For contact",
                  style: TextStyle(
                    fontSize: sizeTitles,
                    color: fontColor,
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            const url = "lenser5app@gmail.com";
                            final Uri url0 = Uri.parse(url);
                            await launchUrl(url0,
                                mode: LaunchMode.externalApplication);
                          },
                          child: const Image(
                            width: sizeMediaIcons,
                            image: AssetImage('images/gmail.png'),
                            height: 60,
                          ),
                        ),
                        const Text(
                          "Gmail",
                          style:
                              TextStyle(fontSize: sizeMedia, color: fontColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            const url = "https://google.com";
                            final Uri url1 = Uri.parse(url);
                            await launchUrl(url1,
                                mode: LaunchMode.externalApplication);
                          },
                          child: const Image(
                            width: sizeMediaIcons - 5,
                            image: AssetImage('images/facebook.png'),
                          ),
                        ),
                        const Text(
                          "Facebook",
                          style: TextStyle(
                            fontSize: sizeMedia,
                            color: fontColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            const url = "https://google.com";
                            final Uri url2 = Uri.parse(url);
                            await launchUrl(url2,
                                mode: LaunchMode.externalApplication);
                          },
                          child: const Image(
                            width: sizeMediaIcons,
                            image: AssetImage('images/twitter.png'),
                          ),
                        ),
                        const Text(
                          "Twitter",
                          style: TextStyle(
                            fontSize: sizeMedia,
                            color: fontColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            const url = "https://google.com";
                            final Uri url3 = Uri.parse(url);
                            await launchUrl(url3,
                                mode: LaunchMode.externalApplication);
                          },
                          child: const Image(
                            width: sizeMediaIcons,
                            image: AssetImage('images/github.png'),
                          ),
                        ),
                        const Text(
                          "GitHub",
                          style: TextStyle(
                            fontSize: sizeMedia,
                            color: fontColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
