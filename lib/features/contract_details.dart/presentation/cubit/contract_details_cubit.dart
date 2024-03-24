import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/features/contract_details.dart/models/header_details.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/form_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';

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
    });
  }

  @override
  void onChange(Change<ContractDetailsState> change) {
    change.toString().logPrint();
    super.onChange(change);
  }
}
