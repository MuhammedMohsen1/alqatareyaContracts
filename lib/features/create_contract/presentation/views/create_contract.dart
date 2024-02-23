import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../../../core/utils/theme.dart';
import 'widgets/custom_date_time_picker.dart';
import 'widgets/drop_down_contract_widget.dart';
import 'widgets/form_create_contract_form.dart';

class CreateContract extends StatelessWidget {
  const CreateContract({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(55.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70.w,
                    height: 70.w,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        context.pop();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.enabyDark,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(3.sp),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(9.w),
                        child: Icon(
                          Ionicons.chevron_forward_outline,
                          color: AppColors.enabyDark,
                          size: 30.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'اسم العقد',
                style: Styles.style18,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 254.w,
                child: const FormCreateContractForm(
                  title: '',
                ),
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
              CustomDateTimePicker(),
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
                onTap: (p0) {},
                items: const [
                  'طربال ديرمابت',
                  'رش امريكى',
                  'طربال + ايزو فوم',
                  'طربال + رش',
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomButton(
                    width: 150.w,
                    height: 50.h,
                    titleStyle: Styles.style15.copyWith(color: Colors.white
                    ),
                    onTap: () {},
                    title: 'حفظ'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
