import 'package:bokia/core/thems/AppColor.dart';
import 'package:flutter/material.dart';

class CustomCoreWidgetTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextInputType? keyboardType;


  const CustomCoreWidgetTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType
  });

  @override
  State<CustomCoreWidgetTextFormField> createState() => _CustomCoreWidgetTextFormFieldState();
}

class _CustomCoreWidgetTextFormFieldState extends State<CustomCoreWidgetTextFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      cursorColor: AppColor.primaryColor,
      obscureText: widget.isPassword && isObscure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? InkWell(
          onTap: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          child: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
          ),
        )
            : null,
        hintStyle: TextStyle(
          color: AppColor.ColorForHintTextField,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        fillColor: AppColor.lightGrayColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
