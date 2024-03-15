import 'package:alqatareyacontracts/core/cache/cahce_utils.dart';
import 'package:alqatareyacontracts/core/utils/app_constants.dart';
import 'package:alqatareyacontracts/core/utils/app_extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  UserParameters userAuth = UserParameters.defaultInit();

  void login(GlobalKey<FormState> formKey) async {
    try {
      emit(LoginLoading());

      if (formKey.currentState!.validate()) {
        // Saved TextController and onSave is Triggered
        formKey.currentState!.save();

        // Starting login
        QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore
            .instance
            .collection(AppPaths.users)
            .where(AppConstants.email, isEqualTo: userAuth.email)
            .get();
        if (validatePassword(query.docs[0].data())) {
          if (isAdmin(query.docs[0].data())) {
            emit(LoginSuccess(AppRoles.admin));
          } else {
            emit(LoginSuccess(AppRoles.notAdmin));
          }
          CacheUtils.login();
        } else {
          emit(LoginFailure());
        }
      } else {
        emit(LoginFailure());
      }
    } catch (e) {
      emit(LoginFailure());
    }
  }

  bool validatePassword(Map<String, dynamic> data) {
    if (data[AppConstants.password] == userAuth.passowrd) {
      return true;
    }
    return false;
  }

  bool isAdmin(Map<String, dynamic> data) {
    if (data[AppConstants.role] == AppRoles.admin) {
      userAuth.role = AppRoles.admin;
      CacheUtils.setRole(AppRoles.admin);
      return true;
    }
    CacheUtils.setRole(AppRoles.notAdmin);
    return false;
  }

  @override
  void onChange(Change<LoginState> change) {
    change.toString().logPrint();
    super.onChange(change);
  }
}

class UserParameters {
  String email;
  String passowrd;
  String role;
  UserParameters(this.email, this.passowrd, this.role);
  factory UserParameters.defaultInit() {
    return UserParameters('', '', AppRoles.notRegistered);
  }
}
