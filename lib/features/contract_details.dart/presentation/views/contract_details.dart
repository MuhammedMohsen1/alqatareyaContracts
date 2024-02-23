import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_button.dart';

import 'widgets/contract_details_data_table.dart';

class ContractDetailsView extends StatelessWidget {
  const ContractDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(17.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text(
                    'الأعمال',
                    style: Styles.style20.copyWith(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              const ContractDetailsDataTable(),
            ],
          ),
        ),
      ),
    );
  }
}
