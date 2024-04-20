import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:source_code/pages/about.dart';
import 'package:source_code/pages/home.dart';
import 'package:source_code/pages/settings.dart';
import 'package:source_code/pages/signing/login.dart';

// ==========================================
// COLORS ===================================

const Color circles = Color.fromRGBO(0, 255, 240, 0.4);
const Color backGround = Color.fromRGBO(23, 23, 23, 1);
const Color buttonColor = Color.fromRGBO(0, 198, 186, 1);
const Color fontColor = Colors.white;

const double smallFont = 12;
const double mediumFont = 18;
const double bigFont = 19;

double currentFont = mediumFont;

const Color blackFont = Colors.black;
const Color whiteFont = Colors.white;
const Color blackBackground = Colors.black;
const Color whiteBackground = Colors.white;

Color currnetFontColor = blackFont;
Color currentBackgroundColor = whiteBackground;

// ==========================================
// THEMES ===================================

class UiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

  final darkTheme = ThemeData(
    primaryColor: Colors.black,
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
      actions: [
        const SizedBox(width: 20),
        PopupMenuButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(),
          ),
          offset: const Offset(-20, 0),
          constraints:
              const BoxConstraints.expand(width: 150, height: double.infinity),
          color: Color.fromARGB(130, 0, 198, 168),
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
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
