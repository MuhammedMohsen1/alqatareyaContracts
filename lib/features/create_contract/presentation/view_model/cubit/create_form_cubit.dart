import 'package:alqatareyacontracts/core/utils/app_constants.dart';
import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/form_model.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/steps_details.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
part 'create_form_state.dart';

class CreateFormCubit extends Cubit<CreateFormState> {
  CreateFormCubit({required this.contracts}) : super(CreateFormInitial());
  FormDetails form = FormDetails.initial();
  List<TypeContract>? rooftypes = [];
  List<TypeContract>? bathstypes = [];
  List<FormDetails> contracts;
  void fetchStepsInformation() async {
    emit(CreateFormLoadingInit());
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
    emit(CreateFormLoadingInitSuccess());
  }

  bool isThereAnyContractWithTheSameName(String contractNo) {
    String newContractNo = contractNo.trim();
    bool isDuplicated = false;
    for (var element in contracts) {
      if (newContractNo == element.contractNo) {
        isDuplicated = true;
        break;
      }
    }
    return isDuplicated;
  }

  // Saving Form and Trigger all onSave Functions
  // but before saving we will validate the inputs
  void saveForm(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(CreateFormLoading());
        formKey.currentState!.save();
        if (isThereAnyContractWithTheSameName(form.contractNo!)) {
          emit(CreateFormDuplicatedContractNo());
        } else {

       
        
        form.toString().logPrint();
        // Saved Successfully
        await FirebaseFirestore.instance
            .collection(AppPaths.contracts)
            .add(form!.toMap());
          emit(CreateFormSuccess());
        }
      } catch (e) {
        emit(CreateFormFailure());
      }
    }
  }

  void reorderRoofStep(int oldIndex, int newIndex) {
    StepsDetails stepDetails = form.roofSteps!.removeAt(oldIndex);
    form?.roofSteps!.insert(newIndex, stepDetails);
    emit(ReorderRoofStepState());
  }

  void updateRoofSteps(List<String> value) {
    form?.roofSteps = StepsDetails.initList(value);

    emit(UpdateRoofsSteps());
  }

  void addRoofSteps(String value) {

    form?.roofSteps?.add(StepsDetails(
      stepTitle: value,
      isDone: false,
    ));

    emit(UpdateRoofsSteps());
  }

  void addBathStep(String value) {
    form?.bathsSteps?.add(StepsDetails(stepTitle: value, isDone: false));

    emit(UpdateBathsSteps());
  }

  void deleteRoofStep(int index) {
    form?.roofSteps!.removeAt(index);
    emit(ReorderRoofStepState());
  }

  void reorderBathsStep(int oldIndex, int newIndex) {
    StepsDetails stepDetails = form!.bathsSteps!.removeAt(oldIndex);
    form?.bathsSteps!.insert(newIndex, stepDetails);
    emit(ReorderBathStepState());
  }

  void deleteBathsStep(int index) {
    form?.bathsSteps!.removeAt(index);
    emit(ReorderBathStepState());
  }

  void checkBoxChanged(bool value) {
    form?.isThereBaths = value;
    emit(CheckBoxChangedState());
  }
}
