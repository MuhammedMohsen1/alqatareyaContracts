import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class CustomDateTimePicker extends StatelessWidget {
  const CustomDateTimePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () async {
              DateTime? dateTime = await showOmniDateTimePicker(
                  context: context,
                  type: OmniDateTimePickerType.date,
                  barrierDismissible: false,
                  theme: ThemeData(
                    useMaterial3: true,
                    colorScheme: const ColorScheme(
                        brightness: Brightness.light,
                        primary: AppColors.enabyDark,
                        onPrimary: AppColors.white,
                        secondary: AppColors.enabyDark,
                        onSecondary: AppColors.enabyDark,
                        error: AppColors.redDark,
                        onError: AppColors.redDark,
                        background: AppColors.white,
                        onBackground: AppColors.white,
                        surface: AppColors.enabyDark,
                        onSurface: AppColors.enabyDark),
                  ),
                  firstDate: DateTime.now().subtract(const Duration(days: 14)),
                  lastDate: DateTime.now().add(const Duration(days: 14)));
            },
            icon: Icon(
              Ionicons.calendar_number_outline,
              color: AppColors.enabyDark,
              size: 24.w,
            )),
        SizedBox(
          width: 16.w,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.borderDataTable,
            ),
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: Text(
              '12/10/2023',
              textAlign: TextAlign.end,
              style: Styles.style14.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
