import 'package:alqatareyacontracts/core/utils/app_constants.dart';
import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/form_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
part 'update_form_state.dart';

class UpdateFormCubit extends Cubit<UpdateFormState> {
  UpdateFormCubit() : super(UpdateFormInitial());

  late final FormDetails contract;
  List<TypeContract>? rooftypes = [];
  List<TypeContract>? bathstypes = [];
  void loadContractDetails(FormDetails contractParams) {
    'ContractDetailsLoading'.logPrint();
    emit(UpdateFormLoading());
    contract = contractParams;
    emit(UpdateFormSuccess());
  }

  void fetchStepsInformation() async {
    emit(UpdateFormLoadingInit());
    DocumentSnapshot bathsSnapShot = await FirebaseFirestore.instance
        .collection(AppPaths.steps)
        .doc(AppConstants.baths)
        .get();
    DocumentSnapshot roofSnapshot = await FirebaseFirestore.instance
        .collection(AppPaths.steps)
        .doc(AppConstants.roofs)
        .get();

    Map<String, dynamic> bathsSteps =
        (bathsSnapShot.data() as Map<String, dynamic>)[AppConstants.baths];
    Map<String, dynamic> roofSteps =
        (roofSnapshot.data() as Map<String, dynamic>)[AppConstants.roofs];

    // Filling the array of Roofs Steps and Types
    for (var element in roofSteps.entries) {
      // List to store the transformed strings

      List<String> valueList = [];
      (element.value as List<dynamic>).forEach((localValue) {
        valueList.add(localValue);
      });
      rooftypes!.add(TypeContract(element.key, valueList ?? []));
    }
    // Filling the array of Baths Steps and Types
    for (var element in bathsSteps.entries) {
      List<String> valueList = [];
      (element.value as List<dynamic>).forEach((localValue) {
        valueList.add(localValue);
      });

      bathstypes!.add(TypeContract(element.key, valueList));
    }
    emit(UpdateFormLoadingInitSuccess());
  }

  // Saving Form and Trigger all onUpdate Functions
  // but before saving we will validate the inputs
  void updateContract(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(UpdateFormLoading());
        formKey.currentState!.save();

        // Saved Successfully
        await FirebaseFirestore.instance
            .collection(AppPaths.contracts)
            .doc(contract.id)
            .update(contract.toMap());
        emit(UpdateFormSuccess());
      } catch (e) {
        emit(UpdateFormFailure());
      }
    }
  }

  void deleteContract() async {
    try {
      emit(DeleteFormLoading());
      contract.toString().logPrint();
      // Saved Successfully
      await FirebaseFirestore.instance
          .collection(AppPaths.contracts)
          .doc(contract.id)
          .delete();

      emit(DeleteFormSuccess());
    } catch (e) {
      emit(DeleteFormFailure());
    }
  }
}
