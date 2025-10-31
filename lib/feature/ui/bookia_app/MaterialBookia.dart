import 'package:bokia/core/helper/localServices.dart';
import 'package:bokia/feature/ui/HomeScreen.dart';
import 'package:bokia/feature/ui/login.dart';
import 'package:bokia/feature/ui/welcomeScreen.dart';
import 'package:flutter/material.dart';

class Materialbookia extends StatelessWidget {
  const Materialbookia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: initialScreen(),
    );
  }
}

Widget initialScreen() {
  final token = LocalServices.sharedPreferences?.getString("userToken");
  debugPrint("Saved token: $token");

  if (token == null || token.isEmpty) {
    return WelcomeScreen();
  } else {
    return HomeScreen(

    );
  }
}
