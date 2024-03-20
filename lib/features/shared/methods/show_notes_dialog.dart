import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showNotesDialog(
    BuildContext context, String title, List<String> content) async {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: AppColors.enabyLight.withOpacity(0.1),
        content: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                      color: AppColors.enabyLight.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.w),
                        bottomRight: Radius.circular(10.w),
                        topLeft: Radius.circular(10.w),
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: Text(
                      content[index],
                      textAlign: TextAlign.end,
                      style: Styles.style12
                        ..copyWith(backgroundColor: Colors.black),
                    ),
                  ),
                );
              },
              itemCount: content.length,
            ),
          ),
        ),
      );
    },
  );
}
