import 'package:flutter/material.dart';
import 'package:flutter_curso_06_preferences_app/src/helpers/preferences.dart';

import '../widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkMode: ${ Preferences.isDark }'),
          Divider(),
          Text('Gender: ${ Preferences.gender }'),
          Divider(),
          Text('User Name: ${ Preferences.name }'),
          Divider(),
        ],
      )
    );
  }
}
