import 'package:flutter/material.dart';
import 'package:flutter_curso_06_preferences_app/src/helpers/preferences.dart';
import 'package:flutter_curso_06_preferences_app/src/widgets/side_menu.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {

  static const String routeName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Configuration', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),),
              const Divider(),
              SwitchListTile(
                value: Preferences.isDark,
                title: const Text('DarkMode'),
                onChanged: (value){
                  Preferences.isDark = value;
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                  value ? themeProvider.setDarkMode() : themeProvider.setLightMode();
                  setState(() {});
                }
              ),
              const Divider(),
              RadioListTile<int>(
                value: 0,
                groupValue: Preferences.gender,
                title: const Text('Man'),
                onChanged: (value) {
                  Preferences.gender = value ?? 0;
                  setState(() {});
                }
              ),
              const Divider(),
              RadioListTile<int>(
                  value: 1,
                  groupValue: Preferences.gender,
                  title: const Text('Woman'),
                  onChanged: (value) {
                    Preferences.gender = value ?? 1;
                    setState(() {});
                  }
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    helperText: 'User Name'
                  ),
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      )
    );
  }
}
