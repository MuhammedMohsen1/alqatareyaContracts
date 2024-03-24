import 'dart:io';

import 'package:alqatareyacontracts/features/create_contract/models/form_model/form_model.dart';
import 'package:alqatareyacontracts/features/create_contract/presentation/view_model/cubit/create_form_cubit.dart';
import 'package:alqatareyacontracts/features/create_contract/presentation/views/create_contract.dart';
import 'package:alqatareyacontracts/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:alqatareyacontracts/features/employee_modules/contract_details.dart/presentation/cubit/contract_details_employee_cubit.dart';
import 'package:alqatareyacontracts/features/update_contract.dart/presentation/view_model/cubit/update_form_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth_feature/login_view.dart';
import '../../features/contract_details.dart/presentation/cubit/contract_details_cubit.dart';
import '../../features/contract_details.dart/presentation/views/contract_details.dart';
import '../../features/dashboard/presentation/cubit/dashboard_cubit.dart';
import '../../features/employee_modules/contract_details.dart/presentation/views/contract_details.dart';
import '../../features/employee_modules/dashboard/presentation/cubit/dashboard_cubit_employee.dart';
import '../../features/employee_modules/dashboard/presentation/view/dashboard_view_employee.dart';
import '../../features/splash_feature/splash_screen.dart';

import '../../features/update_contract.dart/presentation/views/update_contract.dart';
import 'routes.dart';

class AppRouter {
  AppRouter();

  final navigatorKey = GlobalKey<NavigatorState>();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return _getPageRoute(
          const SplashScreen(),
        );

      case Routes.login:
        return _getPageRoute(LoginView());
      case Routes.dashboard:
        return _getPageRoute(BlocProvider(
          create: (context) => DashboardCubit()..loadContracts(),
          child: const DashboardView(),
        ));
      case Routes.dashboardEmployee:
        return _getPageRoute(BlocProvider(
          create: (context) => DashboardEmployeeCubit()..loadContracts(),
          child: const DashboardEmployeeView(),
        ));
      case Routes.createContract:
      
        return _getPageRoute(BlocProvider(
          
          create: (context) => CreateFormCubit()..fetchStepsInformation(),
          child: CreateContract(),
        ));
      case Routes.updateContract:
        FormDetails contract = settings.arguments as FormDetails;
        return _getPageRoute(BlocProvider(
          create: (context) => UpdateFormCubit()..loadContractDetails(contract),
          child: UpdateContract(),
        ));
      case Routes.contractDetails:
        FormDetails contract = settings.arguments as FormDetails;
        return _getPageRoute(BlocProvider(
          create: (context) =>
              ContractDetailsCubit()..loadContractDetails(contract),
          child: const ContractDetailsView(),
        ));
      case Routes.contractDetailsEmployee:
        FormDetails contract = settings.arguments as FormDetails;
        return _getPageRoute(BlocProvider(
          create: (context) =>
              ContractDetailsCubitEmployee()..loadContractDetails(contract),
          child: const ContractDetailsEmployeeView(),
        ));
    }
    return null;
  }

  PageRoute _getPageRoute(Widget child) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        builder: (context) => child,
      );
    } else {
      return CustomPageRouter(child);
    }
  }
}

class CustomPageRouter<T> extends PageRouteBuilder<T> {
  final Widget child;

  CustomPageRouter(this.child)
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              const begin = 0.0;
              const end = 1.0;
              var tween = Tween<double>(begin: begin, end: end);
              return FadeTransition(
                opacity: animation.drive(tween),
                child: child,
              );
            });
}
