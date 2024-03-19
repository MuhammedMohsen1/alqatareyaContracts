import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/failure_widget.dart';
import '../cubit/dashboard_cubit.dart';
import 'widgets/custom_data_table.dart';
import 'widgets/title_data_table.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            switch (state) {
              case DashboardLoading():
              case DashboardInitial():
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.enabyDark,
                  ),
                );
              case DashboardSuccess():
                return RefreshIndicator(
                  onRefresh: () async {
                    context.dashboardCubit().loadContracts();
                  },
                  backgroundColor: AppColors.enabyDark,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(17.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TitleDataTable(),
                        SizedBox(
                          height: 22.h,
                        ),
                        const CustomDataTable(),
                      ],
                    ),
                  ),
                );
              case DashboardFailure():
                return const FailureWidget();
            }
          },
        ),
      ),
    );
  }
}
