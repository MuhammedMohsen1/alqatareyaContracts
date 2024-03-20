import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/features/shared/models/dashboard_row_params.dart';
import 'package:alqatareyacontracts/features/dashboard/presentation/view/widgets/on_going_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../dashboard/presentation/view/widgets/not_started_status_widget.dart';
import '../../../../../dashboard/presentation/view/widgets/status_widget.dart';
import '../../../../../shared/methods/formate_date.dart';

class CustomDataTableEmployee extends StatelessWidget {
  const CustomDataTableEmployee({
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
                  ...List.generate(
                    context.dashboardEmployeeCubit().abstractedContract.length,
                    (index) => getTableRow(
                        context,
                        context
                            .dashboardEmployeeCubit()
                            .abstractedContract[index],
                        index),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    'Log'.logPrint();
    context.push(Routes.contractDetailsEmployee,
        arg: context.dashboardEmployeeCubit().contracts[index]);
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

  TableRow getTableRow(
      BuildContext context, DashboardRowParams params, int index) {
    return TableRow(children: [
      GestureDetector(
        onTap: () {
          _onTap(context, index);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 4.w,
          ),
          child: Text(params.contractNum,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Styles.style12),
        ),
      ),
      GestureDetector(
          onTap: () {
            _onTap(context, index);
          },
          child: params.Status == ContractStatus.FINISHED
              ? const FinishedStatusWidget()
              : params.Status == ContractStatus.NOTSTARTED
                  ? const NotStartedStatusWidget()
                  : const OnGoingStatusWidget()),
      GestureDetector(
        onTap: () {
          _onTap(context, index);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
          child: Text(formateDate(params.createdDate) ?? '-',
              textAlign: TextAlign.center, style: Styles.style12.copyWith()),
        ),
      ),
      GestureDetector(
        onTap: () {
          _onTap(context, index);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
          child: Text(formatDayinArab(params.createdDate) ?? '-',
              textAlign: TextAlign.center, style: Styles.style12),
        ),
      ),
      GestureDetector(
        onTap: () {
          _onTap(context, index);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
          child: Text(params.note,
              textAlign: TextAlign.center, style: Styles.style11),
        ),
      ),
    ]);
  }
}
