import 'package:bokia/core/CustomCoreWidgetTextFormField.dart';
import 'package:bokia/core/thems/AppColor.dart';
import 'package:bokia/core/thems/customButton.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false
      ,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello! Register to get\nstarted",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 35),

            // Username
            const CustomCoreWidgetTextFormField(
              hintText: "Username",
            ),
            const SizedBox(height: 20),

            // Email
            const CustomCoreWidgetTextFormField(
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            // Password
            const CustomCoreWidgetTextFormField(
              hintText: "Password",
              isPassword: true,
            ),
            const SizedBox(height: 20),

            // Confirm Password
            const CustomCoreWidgetTextFormField(
              hintText: "Confirm Password",
              isPassword: true,
            ),
            const SizedBox(height: 30),

            // Register button
            Custombutton(title: 'Register'),

            const Spacer(),

            // Already have account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.black54),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Login Now",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
