import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/features/dashboard/presentation/view/widgets/not_started_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'on_going_status_widget.dart';
import 'status_widget.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border:
                      Border.all(color: AppColors.borderDataTable, width: 1)),
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
                  getTableRow(),
            
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow getTitleTableRow() {
    return TableRow(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text('عقد',
            textAlign: TextAlign.center,
            style: Styles.style12.copyWith(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text('حالة',
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

  TableRow getTableRow() {
    return TableRow(children: [
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 4.w,
        ),
        child: Text('الفروانية',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center, style: Styles.style12),
      ),
      const FinishedStatusWidget(),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text('20/10/2023',
            textAlign: TextAlign.center, style: Styles.style12.copyWith()),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child:
            Text('السبت', textAlign: TextAlign.center, style: Styles.style12),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Text('تم صب الفوم لمطبخين',
            textAlign: TextAlign.center, style: Styles.style11),
      ),
    ]);
  }

}
