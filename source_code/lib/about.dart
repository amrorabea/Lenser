import 'package:flutter/material.dart';
import 'package:source_code/Additional%20Files/colors.dart';
import 'package:source_code/Additional%20Files/containers.dart';
import 'package:url_launcher/url_launcher.dart';

class aboutPage extends StatefulWidget {
  const aboutPage({super.key});

  @override
  State<aboutPage> createState() => _aboutPageState();
}

const double sizeCategories = 19;
const double sizeTitles = 25;
const double sizeWorkers = 23;
const double paddingDividerLeft = 60;
const double paddingDividerRight = 60;
const double sizeMedia = 15;
const double sizeMediaIcons = 50;

class _aboutPageState extends State<aboutPage> {
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
                  "This project was created",
                  style: TextStyle(
                    fontSize: sizeCategories,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "by Modern Academy students",
                  style: TextStyle(
                    fontSize: sizeCategories,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "and used the programming languages",
                  style: TextStyle(
                    fontSize: sizeCategories,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "(Flutter, Python)",
                  style: TextStyle(
                    fontSize: sizeCategories,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "and the help of artificial intelligence,",
                  style: TextStyle(
                    fontSize: sizeCategories,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "which participated in it:",
                  style: TextStyle(
                    fontSize: sizeCategories,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Ahmed Wael",
                  style: TextStyle(
                    fontSize: sizeWorkers,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: paddingDividerLeft, right: paddingDividerRight),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Mahmoud Reda",
                  style: TextStyle(
                    fontSize: sizeWorkers,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: paddingDividerLeft, right: paddingDividerRight),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Seif Ezz",
                  style: TextStyle(
                    fontSize: sizeWorkers,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: paddingDividerLeft, right: paddingDividerRight),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Amro Rabea",
                  style: TextStyle(
                    fontSize: sizeWorkers,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: paddingDividerLeft, right: paddingDividerRight),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Yousef Mohamed",
                  style: TextStyle(
                    fontSize: sizeWorkers,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: paddingDividerLeft, right: paddingDividerRight),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Hossam Dyab",
                  style: TextStyle(
                    fontSize: sizeWorkers,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "You can contact us though",
                  style: TextStyle(
                    fontSize: sizeTitles,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = "lenser5app@gmail.com";
                    final Uri _url = Uri.parse(url);
                    await launchUrl(_url, mode: LaunchMode.externalApplication);
                  },
                  child: const Image(
                    width: sizeMediaIcons,
                    image: AssetImage('images/gmail.png'),
                  ),
                ),
                const Text(
                  "Gmail",
                  style: TextStyle(fontSize: sizeMedia, color: Colors.white),
                ),
                InkWell(
                  onTap: () async {
                    const url = "https://google.com";
                    final Uri _url = Uri.parse(url);
                    await launchUrl(_url, mode: LaunchMode.externalApplication);
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
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = "https://google.com";
                    final Uri _url = Uri.parse(url);
                    await launchUrl(_url, mode: LaunchMode.externalApplication);
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
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = "https://google.com";
                    final Uri _url = Uri.parse(url);
                    await launchUrl(_url, mode: LaunchMode.externalApplication);
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
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
