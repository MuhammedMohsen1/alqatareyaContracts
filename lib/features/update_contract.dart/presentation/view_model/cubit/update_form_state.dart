part of 'update_form_cubit.dart';

@immutable
sealed class UpdateFormState {}

final class UpdateFormInitial extends UpdateFormState {}

final class UpdateFormLoadingInit extends UpdateFormState {}

final class UpdateFormLoadingInitSuccess extends UpdateFormState {}

final class UpdateFormLoading extends UpdateFormState {}

final class UpdateFormSuccess extends UpdateFormState {}

final class UpdateFormFailure extends UpdateFormState {}

final class DeleteFormLoading extends UpdateFormState {}

final class DeleteFormSuccess extends UpdateFormState {}

final class DeleteFormFailure extends UpdateFormState {}
