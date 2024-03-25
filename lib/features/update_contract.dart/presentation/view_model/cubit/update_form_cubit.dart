import 'package:alqatareyacontracts/core/utils/app_constants.dart';
import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/form_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import '../../../../create_contract/models/form_model/steps_details.dart';
part 'update_form_state.dart';

class UpdateFormCubit extends Cubit<UpdateFormState> {
  UpdateFormCubit({required this.contracts}) : super(UpdateFormInitial());

  late final FormDetails contract;
  final List<FormDetails> contracts;

  List<TypeContract>? rooftypes = [];
  List<TypeContract>? bathstypes = [];
  void loadContractDetails(FormDetails contractParams) {
    'ContractDetailsLoading'.logPrint();
    emit(UpdateFormLoading());
    contract = contractParams;
    fetchStepsInformation();
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
  bool isThereAnyContractWithTheSameName(String contractNo) {
    String newContractNo = contractNo.trim();
    int isFirstDuplicaed = 0;
    for (var element in contracts) {
      if (newContractNo == element.contractNo) {
        isFirstDuplicaed += 1;
        break;
      }
    }
    return isFirstDuplicaed >= 2;
  }

  // Saving Form and Trigger all onUpdate Functions
  // but before saving we will validate the inputs
  void updateContract(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(UpdateFormLoading());
        formKey.currentState!.save();
        if (isThereAnyContractWithTheSameName(contract.contractNo!)) {
          emit(UpdateDuplicatedContractNo());
        } else {

       
        // Saved Successfully
        await FirebaseFirestore.instance
            .collection(AppPaths.contracts)
            .doc(contract.id)
            .update(contract.toMap());
          emit(UpdateFormSuccess());
        }
      } catch (e) {
        emit(UpdateFormFailure());
      }
    }
  }

  void reorderRoofStep(int oldIndex, int newIndex) {
    StepsDetails stepDetails = contract.roofSteps!.removeAt(oldIndex);
    contract.roofSteps!.insert(newIndex, stepDetails);
    emit(ReorderRoofStepState());
  }

  void updateRoofSteps(List<String> value) {
    contract.roofSteps = StepsDetails.initList(value);

    emit(UpdateRoofsSteps());
  }

  void addRoofSteps(String value) {
    contract.roofSteps?.add(StepsDetails(stepTitle: value, isDone: false));

    emit(UpdateRoofsSteps());
  }

  void addBathStep(String value) {
    contract.bathsSteps?.add(StepsDetails(stepTitle: value, isDone: false));

    emit(UpdateBathsSteps());
  }

  void deleteRoofStep(int index) {
    contract.roofSteps!.removeAt(index);
    emit(ReorderRoofStepState());
  }

  void reorderBathsStep(int oldIndex, int newIndex) {
    StepsDetails stepDetails = contract.bathsSteps!.removeAt(oldIndex);
    contract.bathsSteps!.insert(newIndex, stepDetails);
    emit(ReorderBathStepState());
  }

  void deleteBathsStep(int index) {
    contract.bathsSteps!.removeAt(index);
    emit(ReorderBathStepState());
  }

  void checkBoxChanged(bool value) {
    contract.isThereBaths = value;
    emit(CheckBoxChangedState());
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
