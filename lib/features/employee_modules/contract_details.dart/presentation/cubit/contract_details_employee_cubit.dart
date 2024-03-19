import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/core/utils/flutter_toast_message.dart';
import 'package:alqatareyacontracts/features/contract_details.dart/models/header_details.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/form_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'contract_details_employee_state.dart';

class ContractDetailsCubitEmployee extends Cubit<ContractDetailsEmployeeState> {
  ContractDetailsCubitEmployee() : super(ContractDetailsEmployeeInitial());
  late final FormDetails contract;
  late final HeaderDetails headerDetails;
  List<Widget> header = [];
  void loadContractDetails(FormDetails contractParams) {
    emit(ContractDetailsEmployeeLoading());
    contract = contractParams;
    addingHeaderWidgets();

    emit(ContractDetailsEmployeeSuccess());
  }

  // Adding Header Widgets to List<Widget>
  void addingHeaderWidgets() {
    // Spliting the Headers
    headerDetails = HeaderDetails.fromMap(contract.toMap());
    headerDetails.toUI().forEach((key, value) {
      if (value != null) {
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
  void updateTheContract() async {
    try {
      // Get a reference to the Firestore collection
      CollectionReference contractsCollection =
          FirebaseFirestore.instance.collection('contracts');

      // Query the contracts collection to find the document with the matching contract number
      QuerySnapshot querySnapshot = await contractsCollection
          .where('contractNo', isEqualTo: contract.contractNo)
          .get();

      // Check if a document with the matching contract number was found
      if (querySnapshot.docs.isNotEmpty) {
        // Get the reference to the first document (assuming there's only one document with the matching contract number)
        DocumentReference contractRef = querySnapshot.docs.first.reference;

        // Update the roofSteps field of the contract document
        await contractRef.update({
          'roofSteps': contract.roofSteps?.map((step) => step.toMap()).toList(),
          'bathsSteps':
              contract.bathsSteps?.map((step) => step.toMap()).toList(),
          'additionalWork': contract.additionalWorkSteps
              ?.map((step) => step.toMap())
              .toList(),
        });

        showToast('تم تحديث الحالة', ToastType.info);
      } else {
        showToast('حدث خطأ', ToastType.error);
      }
    } catch (e) {
      showToast('حدث خطأ', ToastType.error);
    }
  }
  
  @override
  void onChange(Change<ContractDetailsEmployeeState> change) {
    change.toString().logPrint();
    super.onChange(change);
  }
}
