

import 'package:bokia/core/widgets/CustomCoreWidgetTextFormField.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        CustomCoreWidgetTextFormField(hintText: "")
      ],
    ));
  }
}
