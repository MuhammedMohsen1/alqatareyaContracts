import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/features/shared/methods/show_notes_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../../../core/routing/routes.dart';

import '../../../../shared/methods/formate_date.dart';
import '../../../../shared/methods/show_drop_down_dialog.dart';
import '../../../../shared/models/dashboard_row_params.dart';
import 'not_started_status_widget.dart';
import 'on_going_status_widget.dart';
import 'status_widget.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                5: FlexColumnWidth(0.5),
              },
              children: [
                getTitleTableRow(),
                ...List.generate(
                  context.dashboardCubit().abstractedContract.length,
                  (index) => getTableRow(
                      context,
                      context.dashboardCubit().abstractedContract[index],
                      index),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onTap(BuildContext context, int index) {
    'Log'.logPrint();
    context
        .push(Routes.contractDetails,
            arg: context.dashboardCubit().contracts[index])
        .then((value) {
      context.dashboardCubit().loadContracts();
    });
  }

  void _updateContract(BuildContext context, int index) {
    'Log'.logPrint();
    context.push(Routes.updateContract, arg: (
      context.dashboardCubit().contracts[index],
      context.dashboardCubit().contracts
    )).then((value) {
      context.dashboardCubit().loadContracts();
    });
  }

  void _onLongPress(BuildContext context, int index) {
    'onLongPress'.logPrint();
    if (context.dashboardCubit().contracts[index].mandoobName == null) {
      showDropDownDialog(context, ' title', (value) {
        context.dashboardCubit().updateMandoob(index, value!);
      }, context.dashboardCubit().users, index);
    }
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
      Padding(
        padding: EdgeInsets.symmetric(vertical: 7.h),
        child: const SizedBox.shrink(),
      ),
    ]);
  }

  TableRow getTableRow(
      BuildContext context, DashboardRowParams params, int index) {
    return TableRow(children: [
      GestureDetector(
        onTap: () {
          _onTap(context, index);
        },
        onLongPress: () {
          _onLongPress(context, index);
        },
        onDoubleTap: () {},
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
          onLongPress: () {
            _onLongPress(context, index);
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
        onLongPress: () {
          _onLongPress(context, index);
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
        onLongPress: () {
          _onLongPress(context, index);
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
        onLongPress: () {
          _onLongPress(context, index);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
          child: Text(params.note,
              textAlign: TextAlign.center, style: Styles.style11),
        ),
      ),
      Padding(
        padding: EdgeInsets.zero,
        child: IconButton(
          iconSize: 20.w,
          tooltip: 'تعديل العقد',
          onPressed: () {
            _updateContract(context, index);
          },
          icon: Icon(
            Ionicons.create_outline,
            color: AppColors.enabyDark,
            size: 30.r,
          ),
        ),
      ),
    ]);
  }
}
