import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/form_model.dart';
import 'package:alqatareyacontracts/features/create_contract/presentation/views/widgets/drop_down_contract_widget.dart';
import 'package:alqatareyacontracts/features/create_contract/presentation/views/widgets/form_input_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../create_contract/presentation/views/widgets/create_form_dialog_button.dart';
import '../widgets/drop_down_widget.dart';

showDropDownDialog(BuildContext context, String title,
    Function(String?) onSaveValue, content, int index) async {
  String? selectedValue;

  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: AppColors.enabyLight.withOpacity(0.2),
        content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropDownWidget(
                onTap: (value) {
                  selectedValue = value;
                },
                items: content)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CreateFormDialogButton(
                title: 'لا',
                onTap: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
              CreateFormDialogButton(
                title: 'حفظ',
                onTap: () {
                  if (selectedValue != null) {
                    onSaveValue(selectedValue);
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
