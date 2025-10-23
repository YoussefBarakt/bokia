import 'package:bokia/core/thems/AppColor.dart';
import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const Custombutton({
    super.key,
    required this.title,
    this.backgroundColor,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? AppColor.primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: bg,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: backgroundColor == null ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
