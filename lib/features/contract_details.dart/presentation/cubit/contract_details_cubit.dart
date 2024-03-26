import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/colors.dart';
import 'package:alqatareyacontracts/core/utils/flutter_toast_message.dart';
import 'package:alqatareyacontracts/features/contract_details.dart/models/header_details.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/form_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'contract_details_state.dart';

class ContractDetailsCubit extends Cubit<ContractDetailsState> {
  ContractDetailsCubit() : super(ContractDetailsInitial());
  late final FormDetails contract;
  late final HeaderDetails headerDetails;
  List<Widget> header = [];
  void loadContractDetails(FormDetails contractParams) {
    'ContractDetailsLoading'.logPrint();
    emit(ContractDetailsLoading());
    contract = contractParams;
    addingHeaderWidgets();

    emit(ContractDetailsSuccess());
  }

  void addingHeaderWidgets() {
    // Spliting the Headers
    headerDetails = HeaderDetails.fromMap(contract.toMap());
    headerDetails.toUI().forEach((key, value) {
      if (key == 'التلفون') {
        header.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () async {
                  final Uri whatsappChatUri = Uri(
                    scheme: 'https',
                    host: 'wa.me',
                    path: '/2$value?',
                  );
                  if (!await launchUrl(whatsappChatUri)) {
                    showToast('هناك مشكلة', ToastType.error);
                  }
                },
                child: Icon(
                  Ionicons.logo_whatsapp,
                  size: 30.r,
                  color: AppColors.enabyDark,
                ),
              ),
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () async {
                  final Uri phoneCallUri = Uri(scheme: 'tel', path: value);
                  if (!await launchUrl(phoneCallUri)) {
                    showToast('هناك مشكلة', ToastType.error);
                  }
                },
                child: Icon(
                  Ionicons.call,
                  size: 30.r,
                  color: AppColors.enabyDark,
                ),
              ),
              SizedBox(width: 10.w),
              Text(value.toString()),
              SizedBox(
                width: 10.w,
              ),
              Text(key.toString()),
            ],
          ),
        );
      } else {
        if (value != null && value != '') {
          header.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(value.toString()),
                SizedBox(
                  width: 10.w,
                ),
                Text(key.toString()),
              ],
            ),
          );
        }
      }
    });
  }

  @override
  void onChange(Change<ContractDetailsState> change) {
    change.toString().logPrint();
    super.onChange(change);
  }
}
