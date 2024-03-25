import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/steps_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:reorderables/reorderables.dart';
import '../../update_contract.dart/presentation/views/widgets/update_show_input_dialog.dart';

class CustomUpdateIncrementalWidget extends StatefulWidget {
  const CustomUpdateIncrementalWidget({
    super.key,
    required this.steps,
    required this.reorderValues,
    required this.deleteValues,
    required this.addValue,
  });
  final List<StepsDetails> steps;
  final Function(int oldIndex, int newIndex) reorderValues;
  final Function(int index) deleteValues;
  final Function(String value) addValue;
  @override
  State<CustomUpdateIncrementalWidget> createState() =>
      _IncrementalWidgetState();
}

class _IncrementalWidgetState extends State<CustomUpdateIncrementalWidget> {
  late List<Widget> _rows;
  @override
  void initState() {
    super.initState();
  }

  void rebuildUI() {
    'RebuildUI'.logPrint();
    _rows = List.generate(
      widget.steps?.length ?? 0,
      (index) => Container(
        margin: EdgeInsets.all(4.w),
        key: Key('$index'),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.grey),
            borderRadius: BorderRadius.circular(50.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    widget.deleteValues(index);
                  });
                },
                child: Icon(
                  Ionicons.trash,
                  color: Colors.red,
                  size: 24.r,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                widget.steps![index].stepTitle,
                style: Styles.style16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    rebuildUI();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 10.h,
          ),
          ReorderableColumn(
            crossAxisAlignment: CrossAxisAlignment.end,
            onReorder: (int oldIndex, int newIndex) {
              widget.reorderValues(oldIndex, newIndex);
            },
            children: _rows,
          ),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            onTap: () async {
              await showUpdateInputDialog(
                context,
                'اضف خطوة',
                1,
                (String? value) {
                  widget.addValue(value ?? '');
                },
                '',
              );
            },
            borderRadius: BorderRadius.circular(50.r),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.greenLight,
                  borderRadius: BorderRadius.circular(50.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'اضافة',
                      style: Styles.style16,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Icon(
                      Ionicons.add,
                      size: 22.r,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
