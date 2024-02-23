import 'package:alqatareyacontracts/core/routing/routes.dart';
import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class TitleDataTable extends StatelessWidget {
  const TitleDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          title: 'اضافة',
          height: 45.h,
          width: 100.w,
          titleStyle: Styles.style15.copyWith(color: Colors.white),
          onTap: () {
            context.push(Routes.createContract);
          },
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 18.w,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.options,
              color: AppColors.enabyDark,
            )),
        const Spacer(),
        Text(
          'العقود',
          style: Styles.style20.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
