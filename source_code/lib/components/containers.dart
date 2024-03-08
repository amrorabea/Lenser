import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:source_code/components/colors.dart';
import 'package:source_code/pages/about.dart';
import 'package:source_code/pages/home.dart';
import 'package:source_code/pages/settings.dart';
import 'package:source_code/pages/signing/login.dart';
import 'package:blur/blur.dart';

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
