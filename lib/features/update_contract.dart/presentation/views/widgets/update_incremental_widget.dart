import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/steps_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'update_show_input_dialog.dart';

class UpdateIncrementalWidget extends StatefulWidget {
  const UpdateIncrementalWidget({
    super.key,
  });

  @override
  State<UpdateIncrementalWidget> createState() => _IncrementalWidgetState();
}

class _IncrementalWidgetState extends State<UpdateIncrementalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'الأعمال الاضافية',
            style: Styles.style18,
          ),
          SizedBox(
            height: 20.h,
          ),
          ...List.generate(
            context.updateFormCubit().contract.additionalWorkSteps?.length ?? 0,
            (index) => Container(
              margin: EdgeInsets.symmetric(vertical: 12.h),
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
                          context
                              .updateFormCubit()
                              .contract
                              .additionalWorkSteps!
                              .removeAt(index);
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
                      context
                          .updateFormCubit()
                          .contract
                          .additionalWorkSteps![index]!
                          .stepTitle,
                      style: Styles.style16,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () async {
              await showUpdateInputDialog(
                context,
                'أعمال اضافية',
                2,
                (String? value) {
                  setState(() {
                    context.updateFormCubit().contract.additionalWorkSteps?.add(
                        StepsDetails(stepTitle: value ?? '', isDone: false));
                  });
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
