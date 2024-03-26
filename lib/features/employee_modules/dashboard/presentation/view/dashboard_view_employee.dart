import 'dart:ui';

import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/failure_widget.dart';
import '../cubit/dashboard_cubit_employee.dart';
import 'widgets/custom_data_table_employee.dart';
import 'widgets/title_data_table_employee.dart';

class DashboardEmployeeView extends StatelessWidget {
  const DashboardEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<DashboardEmployeeCubit, DashboardEmployeeState>(
          builder: (context, state) {
            switch (state) {
              case DashboardEmployeeLoading():
              case DashboardEmployeeInitial():
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.enabyDark,
                  ),
                );
              case DashboardEmployeeSuccess():
                return RefreshIndicator(
                  onRefresh: () async {
                    context.dashboardEmployeeCubit().loadContracts();
                  },
                  backgroundColor: AppColors.enabyDark,
                  color: Colors.white,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(17.sp),
                      child: CustomScrollView(
                        shrinkWrap: true,
                        slivers: [
                          const SliverToBoxAdapter(
                            child: TitleDataTableEmployee(),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 22.h,
                            ),
                          ),
                          const SliverFillRemaining(
                            child: CustomDataTableEmployee(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              case DashboardEmployeeFailure():
                return const FailureWidget();
            }
          },
        ),
      ),
    );
  }
}
