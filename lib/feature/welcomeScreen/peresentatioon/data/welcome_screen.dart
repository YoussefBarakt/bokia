import 'package:bokia/authontacation/login.dart';
import 'package:bokia/core/thems/AppColor.dart';
import 'package:bokia/core/thems/customButton.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset("assets/welcome.png").image,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                const SizedBox(height: 135),
                Image.asset("assets/splach_logo.png"),
                Text(
                  "Order Your Book Now!",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.dartColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Custombutton(title: "Login"),
                ),
                const SizedBox(height: 2),
                const Custombutton(
                  title: "Register",
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 94),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
