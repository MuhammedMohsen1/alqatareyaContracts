import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({super.key, required this.value});
  bool value;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
      child: Center(
          child: Checkbox(
        value: widget.value,
        onChanged: (value) {
          setState(() {
            widget.value = value!;
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.w),
        ),
        materialTapTargetSize: MaterialTapTargetSize.padded,
        side: BorderSide(color: Colors.grey, width: 1),
        activeColor: AppColors.greenLight,
        checkColor: AppColors.greenDark,
      )),
    );
  }
}
