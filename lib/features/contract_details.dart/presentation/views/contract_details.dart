import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/flutter_toast_message.dart';
import 'package:alqatareyacontracts/features/contract_details.dart/presentation/cubit/contract_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/styles.dart';
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
                      if (context.contractDetailsCubit().contract.gpsLocation !=
                          null)
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () async {
                                final Uri _url = Uri.parse(context
                                    .contractDetailsCubit()
                                    .contract
                                    .gpsLocation!);
                                if (!await launchUrl(_url)) {
                                  showToast(
                                      'حدث خطأ اثناء فتح الخريطة برجاء المحاولة لاحقا',
                                      ToastType.error);
                                }
                              },
                              child: Padding(
                                  padding: EdgeInsets.all(4.r),
                                  child: Icon(
                                    Ionicons.location_outline,
                                    color: AppColors.enabyDark,
                                    size: 24.w,
                                  )),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'الموقع الجعرافى',
                              style:
                                  Styles.style18.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
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
                              null &&
                          context
                              .contractDetailsCubit()
                              .contract
                              .additionalWorkSteps!
                              .isNotEmpty)
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
