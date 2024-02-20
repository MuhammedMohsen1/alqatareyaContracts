import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/form_input_password.dart';
import 'widgets/form_input_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    print("HELLO WORLD");
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400.h,
            width: context.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  AppColors.enabyDark,
                  AppColors.enabyLight,
                ])),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                SizedBox(
                  height: 274.h,
                ),
                Expanded(
                  child: Container(
                    width: context.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(57.sp),
                          topRight: Radius.circular(57.sp),
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 3,
                              spreadRadius: 3),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 320.w,
                          child: FormInputText(
                            title: 'البريد الالكترونى',
                            prefixIcon: Icon(
                              Icons.person,
                              size: 24.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 320.w,
                          child: FormInputPassword(
                            title: 'كلمة المرور',
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 24.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(6.sp),
                          child: Container(
                            width: 200.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.enabyDark,
                                      AppColors.enabyLight
                                    ]),
                                borderRadius: BorderRadius.circular(6.sp)),
                            child: Center(
                                child: Text(
                              'دخول',
                              style: Styles.style18
                                  .copyWith(color: AppColors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: context.height - 859.h - 95.w,
            left: (context.width - 190.w) * 0.5,
            child: SizedBox(
              width: 190.w,
              height: 190.w,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
        ],
      ),
    );
  }
}
