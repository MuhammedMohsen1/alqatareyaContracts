import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';

class MyProgress extends StatelessWidget {
  const MyProgress({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const Center(
        child: CupertinoActivityIndicator(
          radius: 15,
        ),
      );
    } else {
      return const Center(
          child: CircularProgressIndicator(
        color: AppColors.primary,
      ));
    }
  }
}
