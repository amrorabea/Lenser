import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:source_code/components/containers.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

const double currentFont = 18;
const double sizeCategories = 19;
bool swit = false;
String _selectedView = 'Card';

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const appBAR(),
      extendBodyBehindAppBar: true,
      body: Consumer<UiProvider>(
        builder: (context, UiProvider notifier, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Column(
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: sizeCategories,
                  ),
                ),
                const SizedBox(height: 60),
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text("Dark mode"),
                  trailing: Switch(
                      activeTrackColor: Colors.black,
                      activeColor: buttonColor,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.white,
                      value: notifier.isDark,
                      onChanged: (value) => notifier.changeTheme()),
                ),
                const SizedBox(height: 10),
                // =================================================================== FONT SIZE
                ListTile(
                  leading: const Icon(Icons.abc_rounded),
                  title: const Text("Font size"),
                  trailing: PopupMenuButton(
                    onSelected: (value) =>
                        setState(() => _selectedView = value),
                    itemBuilder: (_) => [
                      CheckedPopupMenuItem(
                        checked: _selectedView == 'Large',
                        value: 'Large',
                        child: const Text('Large'),
                      ),
                      CheckedPopupMenuItem(
                        checked: _selectedView == 'Medium',
                        value: 'Medium',
                        child: const Text('Medium'),
                      ),
                      CheckedPopupMenuItem(
                        checked: _selectedView == 'Small',
                        value: 'Small',
                        child: const Text('Small'),
                      ),
                    ],
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 35,
                      color: buttonColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // =================================================================== VOICE
                ListTile(
                  leading: const Icon(Icons.keyboard_voice_outlined),
                  title: const Text("Voice"),
                  trailing: PopupMenuButton(
                    onSelected: (value) =>
                        setState(() => _selectedView = value),
                    itemBuilder: (_) => [
                      CheckedPopupMenuItem(
                        checked: _selectedView == 'Male',
                        value: 'Male',
                        child: const Text('Male'),
                      ),
                      CheckedPopupMenuItem(
                        checked: _selectedView == 'Female',
                        value: 'Female',
                        child: const Text('Female'),
                      ),
                    ],
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 35,
                      color: buttonColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
