import 'package:bokia/core/thems/AppColor.dart';
import 'package:bokia/core/widgets/CustomCoreWidgetTextFormField.dart';
import 'package:bokia/core/widgets/Custombutton.dart';
import 'package:bokia/feature/cubit/Repository/auth_cubit_bloc.dart';
import 'package:bokia/feature/data/models/Register_RequestModel.dart';
import 'package:bokia/feature/ui/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  // Controllers for fields
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();

  bool isEmailValid(String email) {
    return RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$",
    ).hasMatch(email);
  }

  bool isPasswordValid(String value) {
    RegExp regex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regex.hasMatch(value);
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    cityController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello! Register to get\nstarted",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 35),

              // Username
              CustomCoreWidgetTextFormField(
                controller: usernameController,
                hintText: "Username",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Email
              CustomCoreWidgetTextFormField(
                controller: emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else if (!isEmailValid(emailController.text)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password
              CustomCoreWidgetTextFormField(
                controller: passwordController,
                hintText: "Password",
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  } else if (!isPasswordValid(value)) {
                    return "Use uppercase, lowercase, number & special char";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Confirm Password
              CustomCoreWidgetTextFormField(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm your password";
                  } else if (value != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // City
              CustomCoreWidgetTextFormField(
                controller: cityController,
                hintText: "City",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "City is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Address
              CustomCoreWidgetTextFormField(
                controller: addressController,
                hintText: "Address",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Address is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Register Button
              BlocListener<AuthCubitBloc, AuthCubitState>(
                listener: (context, state) {
                  if (state is RegisterLoading) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => const Center(child: CircularProgressIndicator()),
                    );
                  }
                  else if (state is RegisterSuccess) {
                    Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                          (route) => false,
                    );
                  }
                  else if (state is RegisterErrorState) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Text(
                          state.error.contains("exists")
                              ? "This email is already registered."
                              : state.error,
                        ),
                      ),
                    );
                  }
                },
                child: Custombutton(
                  title: 'Register',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubitBloc>().register(
                        RegisterRequestmodel(
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                          name: usernameController.text,
                          address: addressController.text,
                          city: cityController.text,
                        ),
                      );
                    }
                  },
                ),
              ),


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
      ),
    );
  }
}
