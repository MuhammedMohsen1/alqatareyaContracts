import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

import '../../../core/cache/cahce_utils.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/custom_button.dart';

class noDocWidget extends StatefulWidget {
  const noDocWidget({
    super.key,
    required this.isAdmin,
  });
  final bool isAdmin;
  @override
  State<noDocWidget> createState() => _noDocWidgetState();
}

class _noDocWidgetState extends State<noDocWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          height: context.height,
          child: Column(
            children: [
              Spacer(),
              SizedBox(
                width: context.width / 3,
                height: context.width / 3,
                child: Lottie.asset(
                  'assets/lottie/error.json',
                  controller: animationController,
                  onLoaded: (composition) {
                    animationController
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Text(
                'لا يوجد عقود',
                style: Styles.style16,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                title: 'اضافة عقد',
                height: 60.h,
                width: 200.w,
                titleStyle: Styles.style15.copyWith(color: Colors.white),
                onTap: () {
                  context.push(Routes.createContract,
                      arg: context.dashboardCubit().contracts);
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30.r,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'او',
                style: Styles.style14,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                title: 'تسجيل خروج',
                height: 60.h,
                width: 200.w,
                titleStyle: Styles.style15.copyWith(color: Colors.white),
                onTap: () {
                  CacheUtils.signOut();
                  context.push(Routes.login);
                },
                icon: Icon(
                  Ionicons.log_out_outline,
                  color: Colors.white,
                  size: 30.r,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
