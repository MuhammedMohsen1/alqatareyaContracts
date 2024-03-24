import 'package:alqatareyacontracts/features/create_contract/presentation/views/widgets/form_input_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateAreaAndSizeWidget extends StatelessWidget {
  const UpdateAreaAndSizeWidget({
    super.key,
    required this.title,
    this.onsaveFirst,
    this.onsaveSecond,
    required this.contentFirst,
    required this.contentSecond,
  });
  final String title;
  final String contentFirst;
  final String contentSecond;
  final Function(String?)? onsaveFirst;
  final Function(String?)? onsaveSecond;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FormInputWithTitle(
          title: 'نعلاتها',
          width: 90.w,
          content: contentSecond,
          onSave: onsaveSecond,
        ),
        SizedBox(
          width: 40.w,
        ),
        FormInputWithTitle(
          title: title,
          width: 90.w,
          content: contentFirst,
          onSave: onsaveFirst,
        ),
      ],
    );
  }
}
