import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/features/contract_details.dart/presentation/cubit/contract_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../create_contract/presentation/views/widgets/create_form_header.dart';
import '../cubit/contract_details_employee_cubit.dart';
import 'widgets/contract_table_details_with_title.dart';

class ContractDetailsEmployeeView extends StatelessWidget {
  const ContractDetailsEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<ContractDetailsCubitEmployee,
            ContractDetailsEmployeeState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state) {
              case ContractDetailsEmployeeInitial():
              case ContractDetailsEmployeeLoading():
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.enabyDark,
                  ),
                );

              case ContractDetailsEmployeeSuccess():
                return Padding(
                  padding: EdgeInsets.all(17.sp),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const CreateFormHeader(),
                      GridView.count(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10.0),
                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio: 16.h,
                          crossAxisCount: 2,
                          children:
                              context.contractDetailsCubitEmployee().header),
                      if (context
                              .contractDetailsCubitEmployee()
                              .contract
                              .roofSteps !=
                          null)
                        ContractTableDetailsWithTitleEmployee(
                          title: 'الأسطح و الملاحق',
                          stepsDetails: context
                              .contractDetailsCubitEmployee()
                              .contract
                              .roofSteps!,
                          detailsContent: context
                              .contractDetailsCubitEmployee()
                              .contract
                              .tarbalDetails,
                        ),
                      if (context
                              .contractDetailsCubitEmployee()
                              .contract
                              .isThereBaths ??
                          false)
                        ContractTableDetailsWithTitleEmployee(
                          title: 'الحمامات والمطابخ',
                          stepsDetails: context
                              .contractDetailsCubitEmployee()
                              .contract
                              .bathsSteps!,
                          detailsContent: context
                              .contractDetailsCubitEmployee()
                              .contract
                              .bathsDetails,
                        ),
                      if (context
                              .contractDetailsCubitEmployee()
                              .contract
                              .additionalWorkSteps !=
                          null)
                        ContractTableDetailsWithTitleEmployee(
                          title: 'الأعمال الاضافية',
                          stepsDetails: context
                              .contractDetailsCubitEmployee()
                              .contract
                              .additionalWorkSteps!,
                        ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
