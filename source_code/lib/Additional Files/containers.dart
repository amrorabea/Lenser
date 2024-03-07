import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:source_code/Additional%20Files/colors.dart';
import 'package:source_code/about.dart';
import 'package:source_code/home.dart';
import 'package:source_code/settings.dart';
import 'package:source_code/signing/login.dart';

// APP BAR ==================================
class appBAR extends StatelessWidget implements PreferredSizeWidget {
  const appBAR({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: ,
      actions: [
        const SizedBox(width: 20),
        PopupMenuButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          child: Icon(
            Icons.menu_rounded,
            size: 50,
            color: Colors.white,
          ),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  Text('Home'),
                ],
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
                  Text('Settings'),
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
                  Text('About'),
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
                  Text('Logout'),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            if (value == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            } else if (value == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
            } else if (value == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const aboutPage(),
                ),
              );
            } else if (value == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            }
          },
        ),
        Spacer(),
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
      backgroundColor: const Color.fromARGB(255, 10, 10, 10).withAlpha(300),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
