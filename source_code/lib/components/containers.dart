// ignore_for_file: camel_case_types

import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:source_code/main.dart';
import 'package:source_code/pages/about.dart';
import 'package:source_code/pages/Chatbot/chatbot.dart';
import 'package:source_code/pages/home.dart';
import 'package:source_code/pages/settings.dart';
import 'package:source_code/pages/signing/login.dart';
import 'package:url_launcher/url_launcher.dart';

class text extends StatelessWidget {
  final String txt;
  final double size;
  final double? height;
  final FontWeight? weight;
  final TextAlign? align;
  final Color? color;

  const text({
    super.key,
    required this.txt,
    required this.size,
    this.weight,
    this.align,
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      textAlign: align ?? TextAlign.left,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      ),
    );
  }
}

// ==========================================
// CHATBOT ==================================

class messageMe extends StatelessWidget {
  final Message txt;
  const messageMe({
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 230),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: Color.fromARGB(255, 4, 52, 91),
        ),
        child: Text(
          txt.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class messageBot extends StatelessWidget {
  final Message txt;
  const messageBot({
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 230),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: buttonColor,
        ),
        child: Text(
          txt.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ==========================================
// ABOUT VARS ===============================

const double sizeCategories = 19;
const double sizeTitles = 25;
const double sizeWorkers = 23;
const double sizeMedia = 15;
const double sizeMediaIcons = 65;

class contacts extends StatelessWidget {
  // The logos and their links (Gmail, Facebook ...)
  final String imageUrl;
  final String siteLink;
  final String txt;
  const contacts({
    super.key,
    required this.imageUrl,
    required this.siteLink,
    required this.txt,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            final url = siteLink;
            final Uri url3 = Uri.parse(url);
            await launchUrl(url3, mode: LaunchMode.externalApplication);
          },
          child: Image(
            width: sizeMediaIcons,
            image: AssetImage(imageUrl),
          ),
        ),
        Text(
          txt,
          style: const TextStyle(
            fontSize: sizeMedia,
          ),
        ),
      ],
    );
  }
}

// ==========================================
// COLORS ===================================

const Color buttonColor = Color.fromRGBO(255, 115, 92, 1);

const double smallFont = 12;
const double mediumFont = 18;
const double bigFont = 19;

// ==========================================
// THEMES ===================================

class UiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

  final darkTheme = ThemeData(
    primaryColor: Colors.black,
    fontFamily: 'Signika',
    brightness: Brightness.dark,
    primaryColorDark: Colors.black,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
  );

  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    fontFamily: 'Signika',
    brightness: Brightness.light,
    primaryColorDark: Colors.white,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
      ),
    ),
  );
  changeTheme() {
    _isDark = !isDark;
    storage.setBool("isDark", _isDark);
    notifyListeners();
  }

  init() async {
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark") ?? false;
    notifyListeners();
  }
}

// ==========================================
// APP BAR ==================================
class appBAR extends StatelessWidget implements PreferredSizeWidget {
  const appBAR({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        const SizedBox(width: 20),
        PopupMenuButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(),
          ),
          offset: const Offset(-20, 0),
          constraints: const BoxConstraints.expand(width: 150, height: 300),
          color: Color.fromRGBO(255, 115, 92, 0.7),
          child: const Icon(
            Icons.menu_rounded,
            size: 50,
          ),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    Text(' Home'),
                  ],
                ),
              ),
            ),
            const PopupMenuItem(
              value: 2,
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  Text(' Settings'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 3,
              child: Row(
                children: [
                  Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  Text(' About'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 4,
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  Text(' Logout'),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            if (value == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            } else if (value == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
            } else if (value == 3) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            } else if (value == 4) {
              FirebaseAuth.instance.signOut();
              logged = null;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => loginScreen()),
              );
            }
          },
        ),
        const Spacer(),
        const Image(
          image: AssetImage('images/objects.png'),
        ),
        const SizedBox(width: 20),
      ],
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 0,
            sigmaY: 0,
          ),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.secondary.withAlpha(300),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    this.style,
    required this.gradient,
  });
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
