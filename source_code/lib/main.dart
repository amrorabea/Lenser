// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:source_code/components/theme.dart';
import 'package:source_code/pages/get_started.dart';
import 'package:source_code/pages/home.dart';
import 'package:source_code/pages/signing/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool? start;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? flag = prefs.getBool('started');
  if (flag == null) {
    await prefs.setBool('started', true);
    start = true;
  } else {
    start = false;
  }
  runApp(MyApp(
    start: start,
  ));
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
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            //   useMaterial3: true,
            // ),
            theme: notifier.lightTheme,
            home: const SignUp(),
          );
        },
      ),
    );
  }
}
