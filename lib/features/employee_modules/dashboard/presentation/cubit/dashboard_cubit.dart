import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:alqatareyacontracts/features/shared/models/dashboard_row_params.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/app_constants.dart';

import '../../../../create_contract/models/form_model/form_model.dart';

part 'dashboard_state_employee.dart';

class DashboardEmployeeCubit extends Cubit<DashboardEmployeeState> {
  DashboardEmployeeCubit() : super(DashboardEmployeeInitial());
  List<FormDetails> contracts = [];
  List<DashboardRowParams> abstractedContract = [];
  Future<void> loadContracts() async {
    try {
      contracts = [];
      abstractedContract = [];
      emit(DashboardEmployeeLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(AppPaths.contracts).get();
      querySnapshot.docs.forEach((contract) {
        FormDetails formatedContract =
            FormDetails.fromMap(contract.data() as Map<String, dynamic>);
        contracts.add(formatedContract);
        // Spliting the abstract view
        splitAbstractContracts(formatedContract);
      });

      'Success'.logPrint();
      emit(DashboardEmployeeSuccess());
    } catch (e) {
      emit(DashboardEmployeeFailure());
    }
  }

  void splitAbstractContracts(FormDetails contract) {
    var (String latestNote, ContractStatus status) =
        getTheLastestNoteAndStatus(contract);
    abstractedContract.add(DashboardRowParams(contract.contractNo ?? 'فارغ',
        status, contract.createDate, latestNote));
  }

  // This is Log(N) algorithm
  // this return the latest note in the steps for each contract which is alot of work
  (String, ContractStatus) getTheLastestNoteAndStatus(FormDetails contract) {
    // LocalVariables to be used in this func
    String latestNote = '-';
    DateTime lowestDate = DateTime(2000);
    bool isDoneLower = false;
    bool isDoneHigher = true;

    // Loops in this Functions
    contract.roofSteps?.forEach((roofStep) {
      if (roofStep.date != null) {
        // this means that the user has submitted the step as done step
        isDoneLower = true;
        if (roofStep.date!.difference(lowestDate).inMilliseconds > 0) {
          lowestDate = roofStep.date!;
          latestNote = roofStep.notes?.last ?? latestNote;
        }
      } else {
        // this mean that the steps is not completed yet
        isDoneHigher = false;
      }
    });
    contract.bathsSteps?.forEach((bathStep) {
      if (bathStep.date != null) {
        // this means that the user has submitted the step
        isDoneLower = true;
        if (bathStep.date!.difference(lowestDate).inMilliseconds > 0) {
          lowestDate = bathStep.date!;
          latestNote = bathStep.notes?.last ?? latestNote;
        }
      } else {
        // this mean that the steps is not completed yet
        isDoneHigher = false;
      }
    });

    // Assigning status Code
    ContractStatus status = ContractStatus.NOTSTARTED;
    if (isDoneLower == false) {
      status = ContractStatus.NOTSTARTED;
    }
    // isDoneLower == true this means there is atleast one Step done
    // the steps has been started but not finished yet
    else if (isDoneHigher == false && isDoneLower == true) {
      status = ContractStatus.STARTED;
    } else {
      ContractStatus.FINISHED;
    }
    return (latestNote, status);
  }

  @override
  void onChange(Change<DashboardEmployeeState> change) {
    change.toString().logPrint();
    super.onChange(change);
  }
}