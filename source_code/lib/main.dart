// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:source_code/pages/get_started.dart';
import 'package:source_code/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool start;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? flag = prefs.getBool('started');
  if (flag == null) {
    await prefs.setBool('started', true);
    start = true;
  } else {
    start = false;
  }
  runApp(MyApp(start: start));
}

class MyApp extends StatelessWidget {
  bool? start;

  MyApp({
    super.key,
    this.start,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: start == true
          ? const GetStarted()
          : const Home(), // dont forget to check if logged in first and then go to Home
    );
  }
}
