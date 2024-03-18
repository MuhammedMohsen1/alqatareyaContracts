import 'package:alqatareyacontracts/core/routing/routes.dart';
import 'package:alqatareyacontracts/core/utils/app_constants.dart';
import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/flutter_toast_message.dart';
import 'package:alqatareyacontracts/features/auth_feature/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
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
      body: BlocConsumer<LoginCubit, LoginState>(
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
                          ),
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
                                width: 320.w,
                                child: FormInputPassword(
                                  title: 'كلمة المرور',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: 24.w,
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
                              state is LoginLoading
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.enabyDark,
                                      ),
                                    )
                                  : CustomButton(
                                      title: 'دخول',
                                      onTap: () {
                                        context.loginCubit().login(formKey);
                                      },
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
        },
      ),
    );
  }
}
