


import 'package:bokia/core/thems/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding:  EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: bg,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: backgroundColor == null ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
