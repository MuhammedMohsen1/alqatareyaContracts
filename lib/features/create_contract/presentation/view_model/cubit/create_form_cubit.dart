import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/features/create_contract/models/form_model/form_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
part 'create_form_state.dart';

class CreateFormCubit extends Cubit<CreateFormState> {
  CreateFormCubit() : super(CreateFormInitial());
  FormDetails? form = FormDetails.initial();
  // Saving Form and Trigger all onSave Functions
  // but before saving we will validate the inputs
  void saveForm(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      form.toString().logPrint();
      // Saved Successfully
    }
  }
}
