import 'package:bokia/core/thems/AppColor.dart';
import 'package:bokia/core/widgets/CustomCoreWidgetTextFormField.dart';
import 'package:bokia/core/widgets/Custombutton.dart';
import 'package:bokia/core/widgets/CustomerAppBar.dart';
import 'package:bokia/feature/cubit/Repository/auth_cubit_bloc.dart';
import 'package:bokia/feature/data/authontacation/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
                const Text(
                  "Welcome back! Glad\n to see you, Again!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),

                // Email field
                CustomCoreWidgetTextFormField(
                  controller: emailController,
                  hintText: 'Enter your email',
                ),
                const SizedBox(height: 20),

                // Password field
                CustomCoreWidgetTextFormField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  isPassword: true,
                ),
                const SizedBox(height: 13),

                // Forgot password
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 30),

                // Bloc Listener for login states
                BlocListener<AuthCubitBloc, AuthCubitState>(
                  listener: (context, state) {
                    if (state is LoadingState) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is LoadingErrorState) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(state.message),
                        ),
                      );
                    } else if (state is LoadingSuccessState) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Login successful ")),
                      );
                    }
                  },
                  child: Custombutton(
                    title: "Login",
                    onTap: () {
                      context.read<AuthCubitBloc>().login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                    },
                  ),
                ),

              const SizedBox(height: 35),

                // "Or login with" divider
                Row(
                  children: [
                    const Expanded(
                      child: Divider(endIndent: 30, color: AppColor.borderColor),
                    ),
                    Text(
                      "Or login with",
                      style: TextStyle(
                        color: AppColor.darkGrayColorForTextPassword,
                      ),
                    ),
                    const Expanded(
                      child: Divider(indent: 30, color: AppColor.borderColor),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Social icons
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

                // Sign up section
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
                              builder: (context) => BlocProvider(
                                create: (context) => AuthCubitBloc(),
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

  // Social icon builder
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
