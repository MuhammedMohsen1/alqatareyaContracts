import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnGoingStatusWidget extends StatelessWidget {
  const OnGoingStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.yellowLight,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 4.h),
            child: Text('جارى',
                textAlign: TextAlign.center,
                style: Styles.style12.copyWith(color: AppColors.yellowDark)),
          ),
        ),
      ),
    );
  }
}
