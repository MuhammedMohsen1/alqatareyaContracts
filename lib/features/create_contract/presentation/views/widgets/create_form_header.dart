import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class CreateFormHeader extends StatelessWidget {
  const CreateFormHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70.w,
          height: 70.w,
          child: Image.asset('assets/images/logo.png'),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            if (Navigator.canPop(context)) {
              context.pop();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.enabyDark,
                width: 0.8,
              ),
              borderRadius: BorderRadius.circular(3.sp),
            ),
            child: Padding(
              padding: EdgeInsets.all(9.w),
              child: Icon(
                Ionicons.chevron_forward_outline,
                color: AppColors.enabyDark,
                size: 30.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
