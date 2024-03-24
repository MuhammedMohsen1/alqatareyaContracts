import 'package:alqatareyacontracts/core/utils/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../create_contract/presentation/views/widgets/form_create_contract_form.dart';

class UpdateFormInputWithTitle extends StatelessWidget {
  UpdateFormInputWithTitle({
    super.key,
    required this.title,
    this.width,
    this.maxLines,
    this.onSave,
    this.validator,
    this.content,
    this.isDisabled,
  });
  final String title;
  final double? width;
  final int? maxLines;
  final Function(String?)? onSave;
  final String? Function(String? value)? validator;
  final bool? isDisabled;
  String? content = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Text(
          title,
          style: Styles.style18,
        ),
        Container(
          width: width ?? 254.w,
          margin: EdgeInsets.symmetric(vertical: 10.h),
          child: FormCreateContractForm(
            title: '',
            maxLine: maxLines,
            onSave: onSave,
            validator: validator,
            content: content,
            isDisabled: isDisabled,
          ),
        ),
      ],
    );
  }
}
