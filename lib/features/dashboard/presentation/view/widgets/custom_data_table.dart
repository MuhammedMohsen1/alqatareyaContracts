import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'status_widget.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
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
          },
          children: [
            getTitleTableRow(),
            getTableRow(),
            getTableRow(),
            getTableRow(),
            getTableRow(),
            getTableRow(),
            getTableRow(),
            getTableRow(),
            getTableRow(),
            getTableRow(),
            getTableRow(),
            getTableRow(),
            getTableRow(),
            getTableRow(),
            getTableRow(),
          ],
        ),
      ),
    );
  }

  TableRow getTitleTableRow() {
    return TableRow(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Text('عقد',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Text('حالة',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Text('تاريخ',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Text('يوم',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
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

  TableRow getTableRow() {
    return TableRow(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Text('الفروانية',
            textAlign: TextAlign.center, style: Styles.style12),
      ),
      const StatusWidget(),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Text('20/10/2023',
            textAlign: TextAlign.center, style: Styles.style12.copyWith()),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child:
            Text('السبت', textAlign: TextAlign.center, style: Styles.style12),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Text('تم صب الفوم لمطبخين',
            textAlign: TextAlign.center, style: Styles.style11),
      ),
    ]);
  }
}
