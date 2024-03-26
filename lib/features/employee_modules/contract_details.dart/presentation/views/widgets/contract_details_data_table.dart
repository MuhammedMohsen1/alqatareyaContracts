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
import 'details_type.dart';

class ContractDetailsDataTableEmployee extends StatefulWidget {
  const ContractDetailsDataTableEmployee({
    super.key,
    required this.stepsDetails,
    this.isDisabled,
    required this.save,
  });
  final List<StepsDetails> stepsDetails;
  final bool? isDisabled;
  final Function(List<StepsDetails>) save;

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
                  (index) => getTableRow(context, index),
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

  void onChange() {
    widget.save(widget.stepsDetails);
  }

  TableRow getTableRow(BuildContext context, int index) {
    bool checkisDisabled = true;
    if (index == 0 || widget.stepsDetails[index - 1].isDone == true) {
      checkisDisabled = false;
    }
    bool noteisDisabled = true;
    if (widget.stepsDetails[index].isDone == true) {
      noteisDisabled = true;
    } else if (index == 0 || widget.stepsDetails[index - 1].isDone == true) {
      noteisDisabled = false;
    }
    return TableRow(children: [
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 4.w,
        ),
        child: Text(widget.stepsDetails[index].stepTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Styles.style12),
      ),
      CustomCheckBox(
        value: widget.stepsDetails[index].isDone,
        isDisabled: checkisDisabled,
        onChange: (value) {
          setState(() {
            widget.stepsDetails[index].isDone = value;
            if (value == true) {
              widget.stepsDetails[index].date = DateTime.now();
            } else {
              widget.stepsDetails[index].date = null;
            }
            onChange();
          });
        },
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text(
            widget.stepsDetails[index].date != null
                ? formatDate(widget.stepsDetails[index].date!)
                : '-',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith()),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text(formatDayinArab(widget.stepsDetails[index].date) ?? '-',
            textAlign: TextAlign.center, style: Styles.style12),
      ),
      GestureDetector(
        onTap: () {
          if (!noteisDisabled) {
            showInputDialog(context, 'ملاحظات', 4, (String? value) {
              setState(() {
                if (widget.stepsDetails[index].notes != null) {
                  widget.stepsDetails[index].notes!.add(value!);
                } else {
                  widget.stepsDetails[index].notes = [value!];
                }
                widget.stepsDetails[index].date = DateTime.now();
                onChange();
              });
            }, widget.stepsDetails[index].notes?.last);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
          child: Text(
              widget.stepsDetails[index].isDone
                  ? widget.stepsDetails[index].notes?.last ?? '-'
                  : '-',
              textAlign: TextAlign.center,
              style: Styles.style11),
        ),
      ),
    ]);
  }
}
