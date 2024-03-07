import 'package:flutter/material.dart';
import 'package:source_code/components/colors.dart';
import 'package:source_code/components/containers.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

const double sizeCategories = 19;
const double sizeTitles = 25;
const double sizeWorkers = 23;
const double paddingDividerLeft = 60;
const double paddingDividerRight = 60;
const double sizeMedia = 15;
const double sizeMediaIcons = 65;
bool mode = false;

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGround,
        appBar: const appBAR(),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Column(
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: sizeCategories,
                    color: fontColor,
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  children: [
                    const Spacer(),
                    const Text(
                      "Dark mode",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(flex: 10),
                    Theme(
                      data: ThemeData(
                        useMaterial3: true,
                      ).copyWith(
                        colorScheme: Theme.of(context)
                            .colorScheme
                            .copyWith(outline: Colors.white),
                      ),
                      child: Switch(
                          value: mode,
                          activeTrackColor: backGround,
                          inactiveTrackColor: backGround,
                          inactiveThumbColor: Colors.grey,
                          activeColor: buttonColor,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              mode = value;
                            });
                          }),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
