import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/features/shared/methods/show_dialog.dart';
import 'package:alqatareyacontracts/features/employee_modules/contract_details.dart/presentation/views/widgets/contract_details_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../create_contract/models/form_model/steps_details.dart';
import 'details_type.dart';

class ContractTableDetailsWithTitleEmployee extends StatelessWidget {
  const ContractTableDetailsWithTitleEmployee(
      {super.key,
      required this.title,
      required this.stepsDetails,
      this.detailsContent,
      required this.save});
  final String title;
  final List<StepsDetails> stepsDetails;
  final String? detailsContent;
  final Function(List<StepsDetails>) save;
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
            if (detailsContent != null)
              GestureDetector(
                onTap: () {
                  showDeatilsDialog(context, 'تفاصيل $title', detailsContent);
                },
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
        ContractDetailsDataTableEmployee(
            stepsDetails: stepsDetails, save: save),
      ],
    );
  }
}
