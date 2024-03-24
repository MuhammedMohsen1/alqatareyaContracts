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
        surfaceTintColor: AppColors.enabyLight.withOpacity(0.01),
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
                      color: AppColors.enabyLight.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.w
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: Text(
                      content[index],
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: 'ITHRA',
                        fontWeight: FontWeight.w500,
                      ),
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
