import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

class FormCreateContractForm extends StatefulWidget {
  const FormCreateContractForm({
    super.key,
    required this.title,
    this.onSave,
    this.validator,
    this.maxLine,
    this.content,
  });
  final String title;
  final int? maxLine;
  final Function(String? value)? onSave;
  final String? Function(String?)? validator;
  final String? content;

  @override
  State<FormCreateContractForm> createState() => _FormCreateContractFormState();
}

class _FormCreateContractFormState extends State<FormCreateContractForm> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.text = widget.content ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        style: Styles.style14.copyWith(
          color: Colors.black,
        ),
        controller: controller,
        maxLines: widget.maxLine ?? 1,
        validator: widget.validator ?? (value) {},
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          hintStyle: Styles.style14.copyWith(color: Colors.black),
          hintText: widget.title, // Placeholder text
          errorMaxLines: 1,
          errorStyle: Styles.style14.copyWith(
            color: Colors.red,
          ),

          focusedErrorBorder: _border(),
          errorBorder: _border(),
          focusedBorder: _border(),
          enabledBorder: _border(),
          border: _border(),
        ),
        onSaved: widget.onSave,
      ),
    );
  }

  OutlineInputBorder _border() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.kashmeer, width: 0),
      );
}
