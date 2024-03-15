part of 'create_form_cubit.dart';

@immutable
sealed class CreateFormState {}

final class CreateFormInitial extends CreateFormState {}

final class CreateFormLoadingInit extends CreateFormState {}

final class CreateFormLoadingInitSuccess extends CreateFormState {}

final class CreateFormLoading extends CreateFormState {}

final class CreateFormSuccess extends CreateFormState {}

final class CreateFormFailure extends CreateFormState {}
