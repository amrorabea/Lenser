// ignore_for_file: must_be_immutable, unused_local_variable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:source_code/components/containers.dart';
import 'package:source_code/pages/get_started.dart';
import 'package:source_code/pages/home.dart';
import 'package:source_code/pages/signing/login.dart';

bool? start;

void firstOpen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? flag = prefs.getBool('started');
  if (flag == null) {
    await prefs.setBool('started', true);
    start = true;
  } else {
    start = false;
  }
}

User? logged;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyBxHzaT-hGXgL6YMKXeKwfybM3Yr5XtMs0',
              appId: '1:741907606467:android:d0b5be3b43c3050c86ab76',
              messagingSenderId: '741907606467',
              projectId: 'lenser-es'))
      .whenComplete(() {
    // print("Firebase Connected!");
  });
  logged = FirebaseAuth.instance.currentUser;

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
            home: start == true
                ? const GetStarted()
                : logged == null
                    ? loginScreen()
                    : const Home(),
          );
        },
      ),
    );
  }
}
