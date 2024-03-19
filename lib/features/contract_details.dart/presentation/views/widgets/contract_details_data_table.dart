import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/features/create_contract/presentation/views/widgets/custom_date_time_picker.dart';
import 'package:alqatareyacontracts/features/shared/methods/formate_date.dart';
import 'package:alqatareyacontracts/features/shared/methods/show_notes_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../create_contract/models/form_model/steps_details.dart';
import 'custom_check_box.dart';

class ContractDetailsDataTable extends StatelessWidget {
  const ContractDetailsDataTable({
    super.key,
    required this.stepsDetails,
    this.isDisabled,
  });
  final List<StepsDetails> stepsDetails;
  final bool? isDisabled;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.borderDataTable, width: 1)),
            child: Table(
              border: const TableBorder(
                horizontalInside: BorderSide(
                  color: AppColors.borderDataTable,
                  width: 0.8,
                ),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                4: FlexColumnWidth(2),
                3: FlexColumnWidth(0.5),
              },
              children: [
                getTitleTableRow(),
                ...List.generate(
                  stepsDetails.length,
                  (index) => getTableRow(context, stepsDetails[index]),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  TableRow getTitleTableRow() {
    return TableRow(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text('العمل',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text('تم',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text('تاريخ',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text('يوم',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text('ملاحظات',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith(fontWeight: FontWeight.bold)),
      ),
      // Padding(
      //   padding: EdgeInsets.symmetric(vertical: 7.h),
      //   child: const SizedBox.shrink(),
      // ),
    ]);
  }

  TableRow getTableRow(BuildContext context, StepsDetails stepDetails) {
    return TableRow(children: [
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 4.w,
        ),
        child: Text(stepDetails.stepTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Styles.style12),
      ),
      CustomCheckBox(
        value: false,
        isDisabled: true,
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text(
            stepDetails.date != null ? formatDate(stepDetails.date!) : '-',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith()),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text(formatDayinArab(stepDetails.date) ?? '-',
            textAlign: TextAlign.center, style: Styles.style12),
      ),
      GestureDetector(
        onTap: () {
          if ((stepDetails.notes?.length ?? 0) >= 1) {
            showNotesDialog(context, 'ملاحظات', stepDetails.notes!);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
          child: Text(stepDetails.notes?.last ?? '-',
              textAlign: TextAlign.center, style: Styles.style11),
        ),
      ),
    ]);
  }
}
