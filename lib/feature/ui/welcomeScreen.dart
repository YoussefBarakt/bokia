
import 'package:bokia/core/thems/AppColor.dart';
import 'package:bokia/core/widgets/Custombutton.dart';
import 'package:bokia/feature/cubit/Repository/auth_cubit_bloc.dart';
import 'package:bokia/feature/data/authontacation/SignUpScreen.dart';
import 'package:bokia/feature/data/authontacation/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                Custombutton(
                  title: "Login",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => AuthCubitBloc(),
                          child: const LoginScreen(),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 2),
                Custombutton(
                  title: "Register",
                  backgroundColor: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => AuthCubitBloc(),
                          child:SignUpScreen(),
                        ),
                      ),
                    );
                  },
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
