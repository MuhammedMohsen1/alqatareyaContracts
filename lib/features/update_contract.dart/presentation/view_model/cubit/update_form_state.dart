part of 'update_form_cubit.dart';

@immutable
sealed class UpdateFormState {}

final class UpdateFormInitial extends UpdateFormState {}

final class UpdateFormLoadingInit extends UpdateFormState {}

final class UpdateFormLoadingInitSuccess extends UpdateFormState {}

final class UpdateFormLoading extends UpdateFormState {}

final class UpdateFormSuccess extends UpdateFormState {}

final class UpdateFormFailure extends UpdateFormState {}
final class UpdateDuplicatedContractNo extends UpdateFormState {}

final class DeleteFormLoading extends UpdateFormState {}

final class DeleteFormSuccess extends UpdateFormState {}

final class DeleteFormFailure extends UpdateFormState {}

final class DeleteRoofStepState extends UpdateFormState {}

final class ReorderRoofStepState extends UpdateFormState {}

final class DeleteBathStepState extends UpdateFormState {}

final class ReorderBathStepState extends UpdateFormState {}

final class CheckBoxChangedState extends UpdateFormState {}

final class UpdateRoofsSteps extends UpdateFormState {}

final class UpdateBathsSteps extends UpdateFormState {}
