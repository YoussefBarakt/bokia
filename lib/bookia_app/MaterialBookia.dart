

import 'package:bokia/feature/welcomeScreen/peresentatioon/data/welcome_screen.dart';
import 'package:flutter/material.dart';

class Materialbookia extends StatelessWidget {
  const Materialbookia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      home: WelcomeScreen(


      ),
    );
  }
}
