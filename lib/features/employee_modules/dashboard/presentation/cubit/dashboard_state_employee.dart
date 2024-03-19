part of 'dashboard_cubit_employee.dart';

@immutable
sealed class DashboardEmployeeState {}

final class DashboardEmployeeInitial extends DashboardEmployeeState {}

final class DashboardEmployeeLoading extends DashboardEmployeeState {}

final class DashboardEmployeeSuccess extends DashboardEmployeeState {}

final class DashboardEmployeeFailure extends DashboardEmployeeState {}
