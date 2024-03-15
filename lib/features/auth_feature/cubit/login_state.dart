part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  String role;
  LoginSuccess(this.role);
}

final class LoginFailure extends LoginState {}
