import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/injection/di_container.dart';
import '../../core/routing/router.dart';
import '../../features/create_contract/presentation/view_model/cubit/create_form_cubit.dart';
import 'enums.dart';

extension MediaQueryExtension on BuildContext {
  Size get _size => MediaQuery.of(this).size;

  double get width => _size.width;

  double get height => _size.height;
}

extension NavigationExtension on BuildContext {
  void push(String routeName, {Map<String, dynamic>? arg}) {
    sl<AppRouter>()
        .navigatorKey
        .currentState!
        .pushNamed(routeName, arguments: arg);
    // Navigator.of(this).pushNamed(routeName, arguments: arg);
    // Navigator.pushNamed(this, routeName,arguments: arg);
  }

  void pushAndRemove(String routeName) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  void popAndRemove(String routeName) {
    Navigator.popUntil(this, ModalRoute.withName(routeName));
  }

  void pop() {
    return Navigator.pop(this);
  }
}

extension DeviceTypeExtension on DeviceType {
  int getMinWidth() {
    switch (this) {
      case DeviceType.mobile:
        return 320;
      case DeviceType.ipad:
        return 481;
      case DeviceType.smallScreenLaptop:
        return 769;
      case DeviceType.largeScreenDesktop:
        return 1025;
      case DeviceType.extraLargeTV:
        return 1600;
    }
  }

  int getMaxWidth() {
    switch (this) {
      case DeviceType.mobile:
        return 550;
      case DeviceType.ipad:
        return 750;
      case DeviceType.smallScreenLaptop:
        return 1024;
      case DeviceType.largeScreenDesktop:
        return 1200;
      case DeviceType.extraLargeTV:
        return 3840; // any number more than 1200
    }
  }
}

extension Validation on String? {
  bool get isNullOrEmpty => (this != null && this!.isNotEmpty) ? false : true;
}

extension HeightExtension on num {
  SizedBox get height => SizedBox(
        height: toDouble(),
      );
}

extension WidthExtension on num {
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}

// For Using context.layoutCubut directly without providing bloc everytime
extension ContextExtensions on BuildContext {
  CreateFormCubit createFormCubit() {
    return read<CreateFormCubit>();
  }
  // OnBoardingCubit onBoardingCubit() {
  //   // manager layout cubit
  //   return read<OnBoardingCubit>();
  // }
}

// Extension to check if a string contains only digits
extension digits on String {
  bool get isDigitOnly => RegExp(r'^\d+$').hasMatch(this);
}

extension TextLog on String {
  void logPrint() {
    log(this);
  }
}
