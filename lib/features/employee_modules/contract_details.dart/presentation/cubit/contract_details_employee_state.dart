part of 'contract_details_employee_cubit.dart';

@immutable
sealed class ContractDetailsEmployeeState {}

final class ContractDetailsEmployeeInitial
    extends ContractDetailsEmployeeState {}

final class ContractDetailsEmployeeLoading
    extends ContractDetailsEmployeeState {}

final class ContractDetailsEmployeeSuccess
    extends ContractDetailsEmployeeState {}
