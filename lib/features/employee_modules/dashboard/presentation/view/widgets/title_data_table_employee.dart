import 'package:alqatareyacontracts/core/cache/cahce_utils.dart';
import 'package:alqatareyacontracts/core/routing/routes.dart';
import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class TitleDataTableEmployee extends StatelessWidget {
  const TitleDataTableEmployee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              CacheUtils.signOut();
              context.push(Routes.login);
            },
            icon: const Icon(
              Ionicons.log_out_outline,
              color: AppColors.enabyDark,
            )),
        const Spacer(),
        // IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Ionicons.filter,
        //       color: AppColors.enabyDark,
        //     )),
        SizedBox(
          width: 10.w,
        ),
        Text(
          'العقود',
          style: Styles.style20.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
