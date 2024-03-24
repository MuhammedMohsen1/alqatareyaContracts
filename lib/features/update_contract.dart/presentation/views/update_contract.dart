import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/flutter_toast_message.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/core/widgets/custom_button.dart';
import 'package:alqatareyacontracts/features/contract_details.dart/presentation/views/widgets/custom_check_box.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/steps_details.dart';
import 'package:alqatareyacontracts/features/update_contract.dart/presentation/view_model/cubit/update_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'widgets/update_area_and_size_widget.dart';
import 'widgets/update_form_header.dart';
import 'widgets/update_custom_date_time_picker.dart';
import 'widgets/update_drop_down_contract_widget.dart';
import 'widgets/update_form_create_contract_form.dart';
import 'widgets/update_form_input_with_title.dart';
import 'widgets/update_incremental_widget.dart';
import 'widgets/update_show_input_dialog.dart';

class UpdateContract extends StatelessWidget {
  UpdateContract({
    super.key,
  });
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<UpdateFormCubit, UpdateFormState>(
          listener: (context, state) {
            if (state is UpdateFormFailure || state is DeleteFormFailure) {
              showToast('حدث خطأ', ToastType.error);
            } else if (state is UpdateFormSuccess) {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              showToast('تم تعديل العفد بنجاح', ToastType.info);
            } else if (state is DeleteFormSuccess) {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              showToast('تم حذف العفد بنجاح', ToastType.info);
            }
          },
          builder: (context, state) {
            if (state is UpdateFormLoadingInit) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.enabyDark,
                ),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(55.sp),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const UpdateCreateFormHeader(),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          UpdateFormInputWithTitle(
                            title: 'رقم القسيمة',
                            content:
                                context.updateFormCubit().contract.voucherNo,
                            width: 120.w,
                            onSave: (value) {
                              context.updateFormCubit().contract.voucherNo =
                                  value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'رقم القسيمة فارغ';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          UpdateFormInputWithTitle(
                            title: 'رقم العفد',
                            width: 120.w,
                            content:
                                context.updateFormCubit().contract.contractNo,
                            onSave: (value) {
                              context.updateFormCubit().contract.contractNo =
                                  value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'رقم العفد فارغ';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          UpdateFormInputWithTitle(
                            title: 'رقم التليفون',
                            width: 180.w,
                            content:
                                context.updateFormCubit().contract.phoneNumber,
                            onSave: (value) {
                              context.updateFormCubit().contract.phoneNumber =
                                  value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'رقم التليفون فارغ';
                              }
                            },
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          UpdateFormInputWithTitle(
                            title: 'اسم العميل',
                            width: 200.w,
                            content:
                                context.updateFormCubit().contract.clientName,
                            onSave: (value) {
                              context.updateFormCubit().contract.clientName =
                                  value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'اسم العميل فارغ';
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      UpdateFormInputWithTitle(
                        title: 'العنوان',
                        width: 500.w,
                        content: context.updateFormCubit().contract.address,
                        maxLines: 4,
                        onSave: (value) {
                          context.updateFormCubit().contract.address = value;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'تاريخ',
                        style: Styles.style18,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      UpdateCustomDateTimePicker(
                        onSave: (time) {
                          context.updateFormCubit().contract.createDate = time;
                        },
                        dateTime: context.updateFormCubit().contract.createDate,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'نوع العفد',
                        style: Styles.style18,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      UpdateDropDownContractWidget(
                        onTap: (value) {
                          context.updateFormCubit().contract.roofSteps =
                              StepsDetails.initList(value);
                        },
                        items: context.updateFormCubit().rooftypes!,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'حمامات',
                        style: Styles.style18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'طربال',
                            style: Styles.style18,
                          ),
                          CustomCheckBox(
                            value: context
                                    .updateFormCubit()
                                    .contract
                                    .isThereBaths ??
                                false,
                            onChange: (valueChanged) {
                              context.updateFormCubit().contract.isThereBaths =
                                  valueChanged;
                              // Saving Steps
                              context.updateFormCubit().contract.bathsSteps =
                                  StepsDetails.initList(context
                                          .updateFormCubit()
                                          .bathstypes
                                          ?.first
                                          .steps ??
                                      []);
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          UpdateFormInputWithTitle(
                            title: 'عدد الأسمنت',
                            width: 100.w,
                            onSave: (value) {
                              context.updateFormCubit().contract.noCement =
                                  value;
                            },
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'عدد الحمامات',
                                style: Styles.style18,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await showUpdateInputDialog(
                                        context,
                                        'تفاصيل الحمامات',
                                        4,
                                        (String? value) {
                                          context
                                              .updateFormCubit()
                                              .contract
                                              .noCement = value;
                                        },
                                        context
                                            .updateFormCubit()
                                            .contract
                                            .noCement,
                                      );
                                    },
                                    child: Icon(
                                      Ionicons.create_outline,
                                      color: AppColors.enabyDark,
                                      size: 35.r,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Container(
                                    width: 100.w,
                                    margin:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: UpdateFormCreateContractForm(
                                      title: '',
                                      content: context
                                          .updateFormCubit()
                                          .contract
                                          .noBaths,
                                      onSave: (value) {
                                        context
                                            .updateFormCubit()
                                            .contract
                                            .noBaths = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          UpdateFormInputWithTitle(
                            title: 'كمية السكريد',
                            width: 100.w,
                            content:
                                context.updateFormCubit().contract.noSecred,
                            onSave: (value) {
                              context.updateFormCubit().contract.noSecred =
                                  value;
                            },
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'عدد الطربال',
                                style: Styles.style18,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await showUpdateInputDialog(
                                          context, 'تفاصيل الطربال', 4,
                                          (String? value) {
                                        context
                                            .updateFormCubit()
                                            .contract
                                            .tarbalDetails = value;
                                      },
                                          context
                                              .updateFormCubit()
                                              .contract
                                              .tarbalDetails);
                                    },
                                    child: Icon(
                                      Ionicons.create_outline,
                                      color: AppColors.enabyDark,
                                      size: 35.r,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Container(
                                    width: 100.w,
                                    margin:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: UpdateFormCreateContractForm(
                                      title: '',
                                      content: context
                                          .updateFormCubit()
                                          .contract
                                          .noTarbal,
                                      onSave: (value) {
                                        context
                                            .updateFormCubit()
                                            .contract
                                            .noTarbal = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      UpdateAreaAndSizeWidget(
                        title: 'مسطح الأسطح',
                        onsaveFirst: (value) {
                          context.updateFormCubit().contract.areaRoofs = value;
                        },
                        onsaveSecond: (value) {
                          context.updateFormCubit().contract.na3latRoof = value;
                        },
                        contentFirst:
                            context.updateFormCubit().contract.areaRoofs ?? '',
                        contentSecond:
                            context.updateFormCubit().contract.na3latRoof ?? '',
                      ),
                      UpdateAreaAndSizeWidget(
                        title: 'مسطح الحمامات',
                        onsaveFirst: (value) {
                          context.updateFormCubit().contract.areaBaths = value;
                        },
                        onsaveSecond: (value) {
                          context.updateFormCubit().contract.na3latBaths =
                              value;
                        },
                        contentFirst:
                            context.updateFormCubit().contract.areaBaths ?? '',
                        contentSecond:
                            context.updateFormCubit().contract.na3latBaths ??
                                '',
                      ),
                      UpdateAreaAndSizeWidget(
                        title: 'مسطح الممرات',
                        onsaveFirst: (value) {
                          context.updateFormCubit().contract.areaMamarat =
                              value;
                        },
                        onsaveSecond: (value) {
                          context.updateFormCubit().contract.na3latMamarat =
                              value;
                        },
                        contentFirst:
                            context.updateFormCubit().contract.areaMamarat ??
                                '',
                        contentSecond:
                            context.updateFormCubit().contract.na3latMamarat ??
                                '',
                      ),
                      UpdateAreaAndSizeWidget(
                        title: 'مسطح السنادر',
                        onsaveFirst: (value) {
                          context.updateFormCubit().contract.areaSanader =
                              value;
                        },
                        onsaveSecond: (value) {
                          context.updateFormCubit().contract.na3latSanader =
                              value;
                        },
                        contentFirst:
                            context.updateFormCubit().contract.areaSanader ??
                                '',
                        contentSecond:
                            context.updateFormCubit().contract.na3latSanader ??
                                '',
                      ),
                      UpdateFormInputWithTitle(
                        title: 'سقوط الفوم',
                        width: 120.w,
                        content: context.updateFormCubit().contract.so2otFoom,
                        onSave: (value) {
                          context.updateFormCubit().contract.so2otFoom = value;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const UpdateIncrementalWidget(),
                      SizedBox(
                        height: 100.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            state is UpdateFormLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.enabyDark,
                                    ),
                                  )
                                : CustomButton(
                                    width: 150.w,
                                    height: 50.h,
                                    titleStyle: Styles.style15
                                        .copyWith(color: Colors.white),
                                    onTap: () {
                                      context
                                          .updateFormCubit()
                                          .updateContract(formKey);
                                    },
                                    title: 'تعديل'),
                            SizedBox(
                              width: 16.w,
                            ),
                            state is DeleteFormLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.enabyDark,
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      context
                                          .updateFormCubit()
                                          .deleteContract();
                                    },
                                    child: Container(
                                        width: 150.w,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  AppColors.redDark,
                                                  AppColors.redDark
                                                      .withOpacity(0.5)
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(6.sp)),
                                        child: Center(
                                          child: Text(
                                            'حذف',
                                            style: Styles.style15
                                                .copyWith(color: Colors.white),
                                          ),
                                        )),
                                  ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
