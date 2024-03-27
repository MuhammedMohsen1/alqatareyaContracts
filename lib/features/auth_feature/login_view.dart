import 'package:alqatareyacontracts/core/routing/routes.dart';
import 'package:alqatareyacontracts/core/utils/app_constants.dart';
import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/flutter_toast_message.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/features/auth_feature/cubit/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_button.dart';
import 'widgets/form_input_password.dart';
import 'widgets/form_input_text.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              if (state.role == AppRoles.admin) {
                context.pushAndRemove(Routes.dashboard);
              } else if (state.role == AppRoles.notAdmin) {
                context.pushAndRemove(Routes.dashboardEmployee);
              } else {
                showToast('حدث خطأ برجاء المحاولة لاحقاً', ToastType.error);
              }
            } else if (state is LoginFailure) {
              showToast('برجاء التاكد من كلمة السر و البريد الالكترونى',
                  ToastType.error);
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Stack(
                children: [
                  Container(
                    width: context.width,
                    height: context.height,
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
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.width * 0.2,
                        vertical: context.height * 0.2,
                      ),
                      child: Card(
                        elevation: 50, // Elevation effect
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Container(
                       
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.sp)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 30.h, horizontal: 50.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'أهلا بك',
                                  style: Styles.style24,
                                ),
                                Text(
                                  'قم بتسجيل الدخول',
                                  style: Styles.style24,
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                SizedBox(
                                  width: 250.w,
                                  child: FormInputText(
                                    title: 'البريد الالكترونى',
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 30.r,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'برجاء ادخال البريد الالكترونى بشكل صحيح';
                                      }
                                    },
                                    onSave: (value) {
                                      context.loginCubit().userAuth.email =
                                          value ?? '';
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                SizedBox(
                                  width: 250.w,
                                  child: FormInputPassword(
                                    title: 'كلمة المرور',
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      size: 30.r,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'برجاء ادخال كلمة المرور بشكل صحيح';
                                      }
                                    },
                                    onSave: (value) {
                                      context.loginCubit().userAuth.passowrd =
                                          value ?? '';
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                SizedBox(
                                  width: 250.w,
                                  child: state is LoginLoading
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: AppColors.enabyDark,
                                          ),
                                        )
                                      : CustomButton(
                                          title: 'دخول',
                                          width: 250.w,
                                          onTap: () {
                                            context.loginCubit().login(formKey);
                                          },
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


      // Align(
      //                     alignment: Alignment.topCenter,
      //                     child: SizedBox(
      //                       width: 190.w,
      //                       height: 190.w,
      //                       child: Image.asset('assets/images/logo.png'),
      //                     ),
      //                   ),