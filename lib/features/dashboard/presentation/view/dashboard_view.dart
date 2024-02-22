import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import 'widgets/custom_data_table.dart';
import 'widgets/title_data_table.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(17.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitleDataTable(),
            SizedBox(
              height: 22.h,
            ),
            CustomDataTable(),
          ],
        ),
      ),
    );
  }
}
