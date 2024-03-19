import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/app_constants.dart';

import '../../../../core/utils/flutter_toast_message.dart';
import '../../../create_contract/models/form_model/form_model.dart';
import '../../../shared/models/dashboard_row_params.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());
  List<FormDetails> contracts = [];
  List<DashboardRowParams> abstractedContract = [];

  List<String> users = [];

  Future<void> loadContracts() async {
    try {
      contracts = [];
      abstractedContract = [];

      emit(DashboardLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(AppPaths.contracts).get();
      querySnapshot.docs.forEach((contract) {
        FormDetails formatedContract =
            FormDetails.fromMap(contract.data() as Map<String, dynamic>);
        contracts.add(formatedContract);
        // Spliting the abstract view
        splitAbstractContracts(formatedContract);
      });
      loadNotAdminUsers();
      'Success'.logPrint();
      emit(DashboardSuccess());
    } catch (e) {
      emit(DashboardFailure());
    }
  }

  void loadNotAdminUsers() async {
    users = [];
    QuerySnapshot queryUsers =
        await FirebaseFirestore.instance.collection(AppPaths.users).get();
    queryUsers.docs
        .where((users) =>
            (users.data() as Map)[AppConstants.role] == AppRoles.notAdmin)
        .forEach((notAdmin) {
      users.add((notAdmin.data() as Map)[AppConstants.email] as String);
    });
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

  void updateMandoob(int selectedContractIndex, String mandoobName) async {
    try {
      // Get a reference to the Firestore collection
      CollectionReference contractsCollection =
          FirebaseFirestore.instance.collection('contracts');

      // Query the contracts collection to find the document with the matching contract number
      QuerySnapshot querySnapshot = await contractsCollection
          .where('contractNo',
              isEqualTo: contracts[selectedContractIndex].contractNo)
          .get();

      // Check if a document with the matching contract number was found
      if (querySnapshot.docs.isNotEmpty) {
        // Get the reference to the first document (assuming there's only one document with the matching contract number)
        DocumentReference contractRef = querySnapshot.docs.first.reference;

        // Update the roofSteps field of the contract document
        await contractRef.update({
          'mandoobName': mandoobName,
        });
        contracts[selectedContractIndex].mandoobName = mandoobName;
        showToast('تم تحديث الحالة', ToastType.info);
      } else {
        showToast('حدث خطأ', ToastType.error);
      }
    } catch (e) {
      showToast('حدث خطأ', ToastType.error);
    }
  }

  @override
  void onChange(Change<DashboardState> change) {
    change.toString().logPrint();
    super.onChange(change);
  }
}
