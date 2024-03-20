import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/features/contract_details.dart/presentation/cubit/contract_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../create_contract/presentation/views/widgets/create_form_header.dart';
import 'widgets/contract_table_details_with_title.dart';

class ContractDetailsView extends StatelessWidget {
  const ContractDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<ContractDetailsCubit, ContractDetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state) {
              case ContractDetailsInitial():
              case ContractDetailsLoading():
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.enabyDark,
                  ),
                );

              case ContractDetailsSuccess():
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
                          children: context.contractDetailsCubit().header),

                      if (context.contractDetailsCubit().contract.roofSteps !=
                          null)
                        ContractTableDetailsWithTitle(
                          title: 'الأسطح و الملاحق',
                          stepsDetails: context
                              .contractDetailsCubit()
                              .contract
                              .roofSteps!,
                          detailsContent: context
                              .contractDetailsCubit()
                              .contract
                              .tarbalDetails,
                        ),
                      if (context
                              .contractDetailsCubit()
                              .contract
                              .isThereBaths ??
                          false)
                        ContractTableDetailsWithTitle(
                          title: 'الحمامات والمطابخ',
                          stepsDetails: context
                              .contractDetailsCubit()
                              .contract
                              .bathsSteps!,
                          detailsContent: context
                              .contractDetailsCubit()
                              .contract
                              .bathsDetails,
                        ),
                      if (context
                              .contractDetailsCubit()
                              .contract
                              .additionalWorkSteps !=
                          null)
                        ContractTableDetailsWithTitle(
                          title: 'الأعمال الاضافية',
                          stepsDetails: context
                              .contractDetailsCubit()
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
