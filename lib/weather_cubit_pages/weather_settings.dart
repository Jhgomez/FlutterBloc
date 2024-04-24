import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SwitchListTile(
        value: true,
        onChanged: (value) {
          
        },
        title: const Text('Temperature Unit'),
        subtitle: const Text('Celsius/Fahreinheit (Default Celsius)'),
      ),
    );
  }
}