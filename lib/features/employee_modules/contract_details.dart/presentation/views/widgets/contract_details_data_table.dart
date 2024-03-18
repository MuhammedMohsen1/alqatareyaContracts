import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/features/shared/methods/show_dialog.dart';
import 'package:alqatareyacontracts/features/create_contract/presentation/views/widgets/custom_date_time_picker.dart';
import 'package:alqatareyacontracts/features/shared/methods/formate_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../create_contract/models/form_model/steps_details.dart';
import '../../../../../create_contract/presentation/views/widgets/show_input_dialog.dart';
import 'custom_check_box.dart';

class ContractDetailsDataTableEmployee extends StatefulWidget {
  const ContractDetailsDataTableEmployee({
    super.key,
    required this.stepsDetails,
    this.isDisabled,
  });
  final List<StepsDetails> stepsDetails;
  final bool? isDisabled;

  @override
  State<ContractDetailsDataTableEmployee> createState() =>
      _ContractDetailsDataTableEmployeeState();
}

class _ContractDetailsDataTableEmployeeState
    extends State<ContractDetailsDataTableEmployee> {
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
                  widget.stepsDetails.length,
                  (index) => getTableRow(context, widget.stepsDetails, index),
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

  TableRow getTableRow(
      BuildContext context, List<StepsDetails> stepsDetails, int index) {
    bool checkisDisabled = true;
    if (index == 0 || stepsDetails[index - 1].isDone == true) {
      checkisDisabled = false;
    }
    bool noteisDisabled = true;
    if (index == 0 || stepsDetails[index - 1].isDone == true) {
      noteisDisabled = false;
    }
    return TableRow(children: [
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 4.w,
        ),
        child: Text(stepsDetails[index].stepTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Styles.style12),
      ),
      CustomCheckBox(
        value: stepsDetails[index].isDone,
        isDisabled: checkisDisabled,
        onChange: (value) {
          setState(() {
            stepsDetails[index].isDone = value;
          });
        },
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text(
            stepsDetails[index].date != null
                ? formatDate(stepsDetails[index].date!)
                : '-',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith()),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text(formatDayinArab(stepsDetails[index].date) ?? '-',
            textAlign: TextAlign.center, style: Styles.style12),
      ),
      GestureDetector(
        onTap: () {
          if (!noteisDisabled) {
            showInputDialog(context, 'ملاحظات', 4, (String? value) {
              setState(() {
                if (stepsDetails[index].notes != null) {
                  stepsDetails[index].notes!.add(value!);
                } else {
                  stepsDetails[index].notes = [value!];
                }
              });
            }, stepsDetails[index].notes?.last);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
          child: Text(stepsDetails[index].notes?.last ?? '-',
              textAlign: TextAlign.center, style: Styles.style11),
        ),
      ),
    ]);
  }
}
