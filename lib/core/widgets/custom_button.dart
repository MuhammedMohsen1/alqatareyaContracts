import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.color,
    this.textColor,
    this.borderColor,
    this.borderRadius,
      this.width,
      this.height
  });
  final String title;
  final void Function() onPressed;
  final Color color;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(borderRadius ?? 7.sp),
            side: BorderSide(color: borderColor ?? Colors.transparent)),
        padding: EdgeInsets.symmetric(vertical: 15.h),
        
        minimumSize: Size(
            width ?? double.infinity, height ?? 0), // Set width to infinity
      ),
      onPressed: onPressed,
      child: Text(
        title,
        softWrap: true,
        maxLines: 1,
        overflow: TextOverflow.fade,
        style: Styles.style14
            .copyWith(fontWeight: FontWeight.bold, color: textColor),
      ),
    );
  }
}
