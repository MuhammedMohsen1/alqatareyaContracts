import 'package:alqatareyacontracts/core/cache/cahce_utils.dart';
import 'package:alqatareyacontracts/core/utils/app_constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'core/cache/cache_helper.dart';
import 'core/hive/hive_initializer.dart';
import 'core/injection/di_container.dart';
import 'core/routing/router.dart';
import 'core/routing/routes.dart';

import 'features/auth_feature/cubit/login_cubit.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.remove();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ServiceLocator().init();
  await CacheHelper.init();
  await Hive.initFlutter();
  final String role = await CacheUtils.getRole();
  final bool isLoggedIn = await CacheUtils.isLoggedIn();
  await HiveInitializer.initializeHive();
  // Future.delayed(const Duration(milliseconds: 1500),() => FlutterNativeSplash.remove(),);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginCubit(),
      ),
    ],
    child: MyApp(role: role, isLoggedIn: isLoggedIn),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.role, required this.isLoggedIn});
  final String role;
  final bool isLoggedIn;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(744, 1113),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alqatereya',
        initialRoute: isLoggedIn
            ? role == AppRoles.admin
                ? Routes.dashboard
                : Routes.dashboardEmployee
            : Routes.login,
        navigatorKey: sl<AppRouter>().navigatorKey,
        onGenerateRoute: sl<AppRouter>().generateRoute,
      ),
    );
  }
}
