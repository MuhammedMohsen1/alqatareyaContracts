import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/features/create_contract/presentation/views/widgets/form_input_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showDeatilsDialog(BuildContext context, String title, content) async {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: AppColors.enabyLight.withOpacity(0.2),
        content: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FormInputWithTitle(
                  title: title,
                  width: 800.w,
                  maxLines: 10,
                  isDisabled: true,
                  content: content,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
