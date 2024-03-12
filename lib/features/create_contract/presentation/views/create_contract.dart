import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/core/widgets/custom_button.dart';
import 'package:alqatareyacontracts/features/contract_details.dart/presentation/views/widgets/custom_check_box.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'widgets/area_and_size_widget.dart';
import 'widgets/create_form_header.dart';
import 'widgets/custom_date_time_picker.dart';
import 'widgets/drop_down_contract_widget.dart';
import 'widgets/form_create_contract_form.dart';
import 'widgets/form_input_with_title.dart';
import 'widgets/incremental_widget.dart';
import 'widgets/show_input_dialog.dart';

class CreateContract extends StatelessWidget {
  CreateContract({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(55.sp),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CreateFormHeader(),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FormInputWithTitle(
                        title: 'رقم القسيمة',
                        width: 120.w,
                        onSave: (value) {
                          context.createFormCubit().form?.voucherNo = value;
                        },
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      FormInputWithTitle(
                        title: 'رقم العفد',
                        width: 120.w,
                        onSave: (value) {
                          context.createFormCubit().form?.contractNo = value;
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FormInputWithTitle(
                        title: 'رقم التليفون',
                        width: 180.w,
                        onSave: (value) {
                          context.createFormCubit().form?.phoneNumber = value;
                        },
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      FormInputWithTitle(
                        title: 'اسم العميل',
                        width: 200.w,
                        onSave: (value) {
                          context.createFormCubit().form?.clientName = value;
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  FormInputWithTitle(
                    title: 'العنوان',
                    width: 500.w,
                    maxLines: 4,
                    onSave: (value) {
                      context.createFormCubit().form?.address = value;
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
                  CustomDateTimePicker(
                    onSave: (time) {
                      context.createFormCubit().form?.createDate = time;
                    },
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
                  DropDownContractWidget(
                    onTap: (p0) {
                      context.createFormCubit().form?.typeOfContract =
                          TypeContract(p0, []);
                    },
                    items: const [
                      'طربال ديرمابت',
                      'رش امريكى',
                      'طربال + ايزو فوم',
                      'طربال + رش',
                    ],
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
                        value: context.createFormCubit().form?.isThereBaths ??
                            false,
                        onChange: (valueChanged) {
                          context.createFormCubit().form?.isThereBaths =
                              valueChanged;
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FormInputWithTitle(
                        title: 'عدد الأسمنت',
                        width: 100.w,
                        onSave: (value) {
                          context.createFormCubit().form?.noCement = value;
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
                                  await showInputDialog(
                                    context,
                                    'تفاصيل الحمامات',
                                    4,
                                    (String? value) {
                                      context
                                          .createFormCubit()
                                          .form
                                          ?.bathsDetails = value;
                                    },
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
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                child: FormCreateContractForm(
                                  title: '',
                                  onSave: (value) {
                                    context.createFormCubit().form?.noBaths =
                                        value;
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
                      FormInputWithTitle(
                        title: 'كمية السكريد',
                        width: 100.w,
                        onSave: (value) {
                          context.createFormCubit().form?.noSecred = value;
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
                                  await showInputDialog(
                                    context,
                                    'تفاصيل الطربال',
                                    4,
                                    (String? value) {
                                      context
                                          .createFormCubit()
                                          .form
                                          ?.tarbalDetails = value;
                                    },
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
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                child: FormCreateContractForm(
                                  title: '',
                                  onSave: (value) {
                                    context.createFormCubit().form?.noTarbal =
                                        value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  AreaAndSizeWidget(
                    title: 'مسطح الأسطح',
                    onsaveFirst: (value) {
                      context.createFormCubit().form?.areaRoofs = value;
                    },
                    onsaveSecond: (value) {
                      context.createFormCubit().form?.na3latRoof = value;
                    },
                  ),
                  AreaAndSizeWidget(
                    title: 'مسطح الحمامات',
                    onsaveFirst: (value) {
                      context.createFormCubit().form?.areaBaths = value;
                    },
                    onsaveSecond: (value) {
                      context.createFormCubit().form?.na3latBaths = value;
                    },
                  ),
                  AreaAndSizeWidget(
                    title: 'مسطح الممرات',
                    onsaveFirst: (value) {
                      context.createFormCubit().form?.areaMamarat = value;
                    },
                    onsaveSecond: (value) {
                      context.createFormCubit().form?.na3latMamarat = value;
                    },
                  ),
                  AreaAndSizeWidget(
                    title: 'مسطح السنادر',
                    onsaveFirst: (value) {
                      context.createFormCubit().form?.areaSanader = value;
                    },
                    onsaveSecond: (value) {
                      context.createFormCubit().form?.na3latSanader = value;
                    },
                  ),
                  FormInputWithTitle(
                    title: 'سقوط الفوم',
                    width: 120.w,
                    onSave: (value) {
                      context.createFormCubit().form?.so2otFoom = value;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const IncrementalWidget(),
                  SizedBox(
                    height: 100.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomButton(
                        width: 150.w,
                        height: 50.h,
                        titleStyle:
                            Styles.style15.copyWith(color: Colors.white),
                        onTap: () {
                          context.createFormCubit().saveForm(formKey);
                        },
                        title: 'حفظ'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
