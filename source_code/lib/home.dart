import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:source_code/colors.dart';
import 'package:source_code/containers.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _LoginState();
}

double wid = 90;

class _LoginState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGround,
        appBar: appBAR(),
        extendBodyBehindAppBar: true,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                SizedBox(
                  height: 160,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
