import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/strings.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        fontFamily: AppFonts.raleway,
        colorScheme: const ColorScheme.light(primary: Colors.white),
        useMaterial3: true,
        // primarySwatch: AppColors.getLightMaterialColor(),
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.scaffoldBackground,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          centerTitle: true,
          backgroundColor: AppColors.scaffoldBackground,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontFamily: AppFonts.raleway,
              fontSize: 18,
              color: AppColors.titleMedium,
              fontWeight: FontWeight.w600),
          iconTheme: const IconThemeData(color: AppColors.iconColor),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 32.sp,
              color: AppColors.titleLarge,
              fontWeight: FontWeight.w700),

          titleMedium: TextStyle(
              fontSize: 20.sp,
              color: AppColors.titleMedium,
              fontWeight: FontWeight.w600),

          titleSmall: TextStyle(
            fontSize: 16.sp,
            color: AppColors.titleSmall,
            fontWeight: FontWeight.w500,
          ),

          bodySmall: TextStyle(
            fontSize: 14.sp,
            color: AppColors.bodySmall,
            fontWeight: FontWeight.w400,
          ),

          /// for hint
          bodyMedium: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.bodyMedium,
          ),

          labelSmall: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.labelSmall,
          ),

          displayMedium: TextStyle(
              color: AppColors.displayMedium,
              fontFamily: AppFonts.poppins,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp),

          headlineLarge: TextStyle(
            fontSize: 60.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.iconColor,
        ),
        focusColor: AppColors.primary,
        disabledColor: AppColors.inActiveColor,
        indicatorColor: AppColors.activeColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(AppColors.primary),
          padding: const MaterialStatePropertyAll(
              EdgeInsetsDirectional.symmetric(vertical: 10)),
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r))),
          enableFeedback: true,
          textStyle: MaterialStatePropertyAll(TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: AppFonts.poppins)),
          // textStyle: ,
        )),
      );

  static ThemeData darkTheme() => ThemeData.dark();

// static CupertinoThemeData cupertinoLightTheme() => const CupertinoThemeData(
//       primaryColor: AppColors.colorPrimary,
//       scaffoldBackgroundColor: AppColors.scaffoldBackGround,
//       textTheme: CupertinoTextThemeData(
//         primaryColor: AppColors.colorPrimary,
//       ),
//     );
}
