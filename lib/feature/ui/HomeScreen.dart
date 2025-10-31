


import 'package:bokia/core/helper/localServices.dart';
import 'package:bokia/feature/ui/welcomeScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            LocalServices.sharedPreferences?.remove("userToken");
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()), (e)=>false);
          }, child: Text("LogOut"))
        ],
      ),
    );
  }
}
