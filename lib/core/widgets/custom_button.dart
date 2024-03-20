import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
      required this.onTap,
    required this.title,
      this.icon,
      this.height,
      this.width,
      this.titleStyle
    
  });
  final Function() onTap;
  final String title;
  final Icon? icon;
  final double? width;
  final double? height;
  final TextStyle? titleStyle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.sp),
      child: Container(
        width: width ?? 200.w,
        height: height ?? 60.h,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.enabyDark, AppColors.enabyLight]),
            borderRadius: BorderRadius.circular(6.sp)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              
            Text(
              title,
              style:
                  titleStyle ?? Styles.style18.copyWith(color: AppColors.white),
            ),
            if (icon != null) ...[
              SizedBox(
                width: 12.w,
              ),
              icon!,
            ],
          ],
        )),
      ),
    );
  }
}
