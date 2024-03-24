import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

// ignore: must_be_immutable
class UpdateDropDownContractWidget extends StatefulWidget {
  UpdateDropDownContractWidget(
      {super.key, required this.onTap, required this.items});
  Function(List<String>) onTap;
  List<TypeContract> items;
  @override
  State<UpdateDropDownContractWidget> createState() =>
      _DropDownContractWidgetState();
}

class _DropDownContractWidgetState extends State<UpdateDropDownContractWidget> {
  TypeContract? value;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 245.w,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.borderDataTable),
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.all(5.r),
          child: DropdownButton<TypeContract>(
            borderRadius: BorderRadius.circular(10.r),

            isExpanded: true,
            value: value, // Default value
            onChanged: (TypeContract? newValue) {
              setState(() {
                value = newValue;
              });

              widget.onTap(newValue?.steps ?? []);
            },
            items: widget.items
                .map<DropdownMenuItem<TypeContract>>((TypeContract value) {
              return DropdownMenuItem<TypeContract>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      value.title,
                      textAlign: TextAlign.end,
                      style: Styles.style16.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
            underline: const SizedBox.shrink(),
            alignment: Alignment.centerRight,

            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child:
                  Icon(Ionicons.chevron_down, color: Colors.black, size: 22.w),
            ),
            hint: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                'اختر',
                textAlign: TextAlign.start,
                style: Styles.style14.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
