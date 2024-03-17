part of 'contract_details_cubit.dart';

@immutable
sealed class ContractDetailsState {}

final class ContractDetailsInitial extends ContractDetailsState {}

final class ContractDetailsLoading extends ContractDetailsState {}

final class ContractDetailsSuccess extends ContractDetailsState {}
