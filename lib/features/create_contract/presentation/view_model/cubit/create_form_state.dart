part of 'create_form_cubit.dart';

@immutable
sealed class CreateFormState {}

final class CreateFormInitial extends CreateFormState {}

final class CreateFormLoadingInit extends CreateFormState {}

final class CreateFormLoadingInitSuccess extends CreateFormState {}

final class CreateFormLoading extends CreateFormState {}

final class CreateFormSuccess extends CreateFormState {}

final class CreateFormFailure extends CreateFormState {}
final class CreateFormDuplicatedContractNo extends CreateFormState {}

final class DeleteRoofStepState extends CreateFormState {}

final class ReorderRoofStepState extends CreateFormState {}

final class DeleteBathStepState extends CreateFormState {}

final class ReorderBathStepState extends CreateFormState {}

final class CheckBoxChangedState extends CreateFormState {}

final class UpdateRoofsSteps extends CreateFormState {}

final class UpdateBathsSteps extends CreateFormState {}
