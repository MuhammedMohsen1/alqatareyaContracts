import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { error, warning, info }

void showToast(String message, ToastType type) {
  // ignore: unused_local_variable
  if (!Platform.isMacOS) {
    Color backgroundColor;
    switch (type) {
      case ToastType.error:
        backgroundColor = Colors.red;
        break;
      case ToastType.warning:
        backgroundColor = Colors.orange;
        break;
      case ToastType.info:
        backgroundColor = Colors.green;
        break;
    }

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: Colors.white,
        fontSize: 14.w);
  }
}
