import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../create_contract/presentation/views/widgets/create_form_header.dart';
import 'widgets/contract_table_details_with_title.dart';

class ContractDetailsView extends StatelessWidget {
  const ContractDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(17.sp),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const CreateFormHeader(),
              GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.all(10.0),
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 16.h,
                crossAxisCount: 2,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('182'),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(':مسطح الاسطح و الملاحق'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('182'),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(':رقم القسيمة'),
                    ],
                  ),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('الجهراء'),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(':العنوان'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('محمد محسن'),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(':اسم العميل'),
                    ],
                  ),
                ],
              ),
              ContractTableDetailsWithTitle(
                title: 'الأسطح و الملاحق',
              ),
              ContractTableDetailsWithTitle(
                title: 'الحمامات والمطابخ',
              ),
              ContractTableDetailsWithTitle(
                title: 'الأعمال الاضافية',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
