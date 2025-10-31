import 'package:bokia/core/thems/AppColor.dart';
import 'package:bokia/core/widgets/CustomCoreWidgetTextFormField.dart';
import 'package:bokia/core/widgets/Custombutton.dart';
import 'package:bokia/core/widgets/CustomerAppBar.dart';
import 'package:bokia/feature/cubit/Repository/auth_cubit_bloc.dart';
import 'package:bokia/feature/ui/HomeScreen.dart';
import 'package:bokia/feature/ui/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomerAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 29),

                // 👋 Welcome Text
                const Text(
                  "Welcome back! Glad\n to see you, Again!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 32),

                // 📧 Email
                CustomCoreWidgetTextFormField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    } else if (!emailRegex.hasMatch(value)) {
                      return "Enter a valid email (e.g. example@mail.com)";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // 🔒 Password
                CustomCoreWidgetTextFormField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 13),

                // 🔑 Forgot Password
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                const SizedBox(height: 30),

                // 🧠 Bloc Listener (Login States)
                BlocListener<AuthCubitBloc, AuthCubitState>(
                  listener: (context, state) {
                    if (state is LoadingState) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is LoadingErrorState) {
                      if (Navigator.canPop(context)) Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Login Failed"),
                          content: Text(state.error),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    } else if (state is LoadingSuccessState) {
                      if (Navigator.canPop(context)) Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Login successful"),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  child: Custombutton(
                    title: "Login",
                    onTap: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      if (!emailRegex.hasMatch(email)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                            Text("Please enter a valid email address."),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }

                      if (password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter your password."),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }

                      context.read<AuthCubitBloc>().login(
                        email: email,
                        password: password,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 35),

                // 🔹 Divider with text
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        endIndent: 30,
                        color: AppColor.borderColor,
                      ),
                    ),
                    Text(
                      "Or login with",
                      style: TextStyle(
                        color: AppColor.darkGrayColorForTextPassword,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        indent: 30,
                        color: AppColor.borderColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // 🌐 Social Login Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon("assets/google_ic.svg"),
                    const SizedBox(width: 20),
                    _buildSocialIcon("assets/cib_apple.svg"),
                    const SizedBox(width: 20),
                    _buildSocialIcon("assets/facebook_ic.svg"),
                  ],
                ),

                const SizedBox(height: 35),

                // 🧾 Sign Up Section
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account? ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                create: (_) => AuthCubitBloc(),
                                child: const SignUpScreen(),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🌐 Social Icon Builder
  Widget _buildSocialIcon(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.borderColor),
      ),
      child: SvgPicture.asset(assetPath, height: 24, width: 24),
    );
  }
}
