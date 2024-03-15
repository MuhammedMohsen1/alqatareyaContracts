import 'package:alqatareyacontracts/core/utils/app_constants.dart';
import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/form_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
part 'create_form_state.dart';

class CreateFormCubit extends Cubit<CreateFormState> {
  CreateFormCubit() : super(CreateFormInitial());
  FormDetails? form = FormDetails.initial();
  List<TypeContract>? rooftypes = [];
  List<TypeContract>? bathstypes = [];

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

  // Saving Form and Trigger all onSave Functions
  // but before saving we will validate the inputs
  void saveForm(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(CreateFormLoading());
        formKey.currentState!.save();
        form.toString().logPrint();
        // Saved Successfully
        await FirebaseFirestore.instance
            .collection(AppPaths.contracts)
            .add(form!.toMap());
        emit(CreateFormSuccess());
      } catch (e) {
        emit(CreateFormFailure());
      }
    }
  }
}
