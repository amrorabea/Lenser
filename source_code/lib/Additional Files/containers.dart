import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:source_code/Additional%20Files/colors.dart';
import 'package:source_code/home.dart';
import 'package:url_launcher/url_launcher.dart';

// CIRCLES
class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = circles,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );
  }
}

// APP BAR ==================================
class appBAR extends StatelessWidget implements PreferredSizeWidget {
  const appBAR({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: ,
      actions: [
        const SizedBox(width: 5),
        const Row(
          children: [
            Image(
              image: AssetImage('images/objects.png'),
            ),
            Text(
              "𝕝𝕖𝕟𝕤𝕖𝕣",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
        const Spacer(),
        PopupMenuButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          color: const Color.fromRGBO(1, 141, 131, 0.7),
          child: const Image(
            width: 40,
            image: AssetImage('images/option.png'),
          ),
          itemBuilder: (context) => [
            const PopupMenuItem(
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  Text('Home'),
                ],
              ),
              // value: Home(),
            ),
            const PopupMenuItem(
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  Text('Settings'),
                ],
              ),
              // value: Home(),
            ),
            const PopupMenuItem(
              child: Row(
                children: [
                  Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  Text('About'),
                ],
              ),
              // value: Home(),
            ),
            const PopupMenuItem(
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  Text('Logout'),
                ],
              ),
              // value: Home(),
            ),
          ],
        ),
        const SizedBox(width: 5),
      ],
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 20,
          ),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.blue.withAlpha(300),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
