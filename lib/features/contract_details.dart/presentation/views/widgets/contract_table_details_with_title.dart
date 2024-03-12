import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/features/contract_details.dart/presentation/views/widgets/contract_details_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class ContractTableDetailsWithTitle extends StatelessWidget {
  const ContractTableDetailsWithTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Padding(
                  padding: EdgeInsets.all(4.r),
                  child: Icon(
                    Ionicons.document_text_outline,
                    color: AppColors.enabyDark,
                    size: 24.w,
                  )),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: Styles.style18.copyWith(color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 22.h,
        ),
        const ContractDetailsDataTable(),
      ],
    );
  }
}
