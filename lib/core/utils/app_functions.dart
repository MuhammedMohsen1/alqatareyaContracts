import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_extensions.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/enums.dart';

class AppFunctions {
  const AppFunctions();

  static void showMySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: 18, color: Colors.white),
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsetsDirectional.symmetric(vertical: 10.h, horizontal: 8.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
    ));
  }

  // static void showToast(
  //         {required String message, required ToastStates state}) =>
  //     Fluttertoast.showToast(
  //         msg: message,
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 2,
  //         backgroundColor: _chooseToastColor(state),
  //         textColor: Colors.white,
  //         fontSize: 16.sp);

  static Future<void> showAdaptiveDialog(BuildContext context,
      {required String title,
      required String actionName,
      required void Function() onPress}) async {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            elevation: 5,
            shadowColor: Colors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  // LocaleKeys.cancel.tr(),
                  'Cancel',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
              ),
              TextButton(
                onPressed: () {
                  onPress();
                  context.pop();
                },
                child: Text(
                  actionName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title),
          insetAnimationCurve: Curves.ease,
          insetAnimationDuration: const Duration(microseconds: 600),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text(
                // LocaleKeys.cancel.tr()
                'Cancel',
              ),
              onPressed: () => context.pop(),
            ),
            CupertinoDialogAction(
              onPressed: onPress,
              child: Text(
                  // LocaleKeys.accept.tr()
                  actionName),
            )
          ],
        ),
      );
    }
  }

  static Color _chooseToastColor(ToastStates state) {
    switch (state) {
      case ToastStates.error:
        return Colors.black;
      case ToastStates.success:
        return Colors.green;
      case ToastStates.warning:
        return Colors.amber;
    }
  }
}
