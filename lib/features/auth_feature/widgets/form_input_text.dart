import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/strings.dart';
import '../../../core/utils/styles.dart';

class FormInputText extends StatefulWidget {
  const FormInputText(
      {super.key,
      required this.title,
      this.onSave,
      this.validator,
      required this.prefixIcon});
  final String title;
  final Function(String? value)? onSave;
  final String? Function(String?)? validator;
  final Icon prefixIcon;
  @override
  State<FormInputText> createState() => _FormInputTextState();
}

class _FormInputTextState extends State<FormInputText> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        style: Styles.style15.copyWith(
          color: const Color(0xFF6A6A6A),
        ),
        controller: controller,
        validator: widget.validator ?? (value) {},
        cursorColor: Colors.black,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: const Color(0xFFF3F3F3),
          hintStyle: Styles.style15.copyWith(color: Colors.black),

          prefixIcon: widget.prefixIcon,
          hintText: widget.title, // Placeholder text
          errorMaxLines: 1,
          errorStyle: Styles.style15.copyWith(
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
