// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:source_code/components/containers.dart';
import 'package:source_code/pages/get_started.dart';
import 'package:source_code/pages/home.dart';
import 'package:source_code/pages/signing/signup.dart';

bool? start;

void firstOpen() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? flag = prefs.getBool('started');
  if (flag == null) {
    await prefs.setBool('started', true);
    start = true;
  } else {
    start = false;
  }
}

void main() async {
  firstOpen();
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
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child: Consumer<UiProvider>(
        builder: (context, UiProvider notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme:
                notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
            theme: notifier.lightTheme,
            home: start == true ? const GetStarted() : const Home(),
          );
        },
      ),
    );
  }
}
