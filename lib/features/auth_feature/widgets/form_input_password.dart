import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/styles.dart';

class FormInputPassword extends StatefulWidget {
  const FormInputPassword(
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
  State<FormInputPassword> createState() => _FormInputPasswordState();
}

class _FormInputPasswordState extends State<FormInputPassword> {
  bool isObsecure = true;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            obscureText: isObsecure,
            style: Styles.style15.copyWith(
              color: const Color(0xFF6A6A6A),
            ),
            controller: controller,
            validator: widget.validator,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: const Color(0xFFF3F3F3),
                hintStyle: Styles.style15.copyWith(
                  color: Colors.black,
                ),
                hintText: widget.title, // Placeholder text

                errorMaxLines: 1,
                errorStyle: Styles.style15.copyWith(
                  color: Colors.red,
                ),
                prefixIcon: widget.prefixIcon,
                focusedErrorBorder: _border(),
                errorBorder: _border(),
                focusedBorder: _border(),
                enabledBorder: _border(),
                border: _border(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: isObsecure
                        ? Icon(
                            Icons.visibility,
                            color: const Color(0xFF6A6A6A),
                            size: 20.w,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: const Color(0xFF6A6A6A),
                            size: 20.w,
                          ),
                  ),
                )),
            onChanged: (value) {
              if (widget.onSave != null) {
                widget.onSave!(value);
              }
            },
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.kashmeer, width: 0),
      );
}
