import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatefulWidget {
  CustomCheckBox(
      {super.key, required this.value, this.onChange, this.isDisabled});
  final Function(bool)? onChange;
  bool value;
  final bool? isDisabled;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Checkbox(
      value: widget.value,
      onChanged: (value) {
        if (widget.isDisabled != true) {
        setState(() {
          widget.value = value!;
          if (widget.onChange != null) {
            widget.onChange!(value);
          }
        });
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.w),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: const BorderSide(color: Colors.grey, width: 1),
      activeColor: AppColors.greenLight,
      checkColor: AppColors.greenDark,
    ));
  }
}
