import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/features/create_contract/presentation/views/widgets/form_input_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'update_form_dialog_button.dart';

showUpdateInputDialog(BuildContext context, String title, int maxlines,
    Function(String?)? onSaveValue, content) async {
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
                  maxLines: maxlines,
                  onSave: (String? value) {
                    if (onSaveValue != null) {
                      onSaveValue(value);
                    }
                  },
                  content: content,
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdateCreateFormDialogButton(
                title: 'لا',
                onTap: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
              UpdateCreateFormDialogButton(
                title: 'حفظ',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          )
        ],
      );
    },
  );
}
