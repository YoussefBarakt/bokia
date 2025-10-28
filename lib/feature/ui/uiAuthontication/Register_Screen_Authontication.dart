



import 'package:bokia/core/widgets/CustomCoreWidgetTextFormField.dart';
import 'package:bokia/core/widgets/CustomerAppBar.dart';
import 'package:flutter/material.dart';

class RegisterScreenAuthontication extends StatelessWidget {
  const RegisterScreenAuthontication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomerAppBar(),
       body:SingleChildScrollView(
         child: Column(
           children: [
             CustomCoreWidgetTextFormField(hintText: "")
           ],
         ),
       ),
    );

  }
}
