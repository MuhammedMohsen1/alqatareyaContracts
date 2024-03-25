import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/flutter_toast_message.dart';
import '../../../../create_contract/models/form_model/steps_details.dart';
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
                              .gpsLocation !=
                          null)
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () async {
                                final Uri _url = Uri.parse(context
                                    .contractDetailsCubitEmployee()
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
                          save: (List<StepsDetails> stepsDetails) {
                            context
                                .contractDetailsCubitEmployee()
                                .contract
                                .roofSteps = stepsDetails;
                            context
                                .contractDetailsCubitEmployee()
                                .updateTheContract();
                          },
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
                          save: (List<StepsDetails> stepsDetails) {
                            context
                                .contractDetailsCubitEmployee()
                                .contract
                                .bathsSteps = stepsDetails;
                            context
                                .contractDetailsCubitEmployee()
                                .updateTheContract();
                          },
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
                          save: (List<StepsDetails> stepsDetails) {
                            context
                                .contractDetailsCubitEmployee()
                                .contract
                                .additionalWorkSteps = stepsDetails;
                            context
                                .contractDetailsCubitEmployee()
                                .updateTheContract();
                          },
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
