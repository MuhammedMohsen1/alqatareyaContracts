import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/cache/cache_helper.dart';
import 'core/hive/hive_initializer.dart';
import 'core/injection/di_container.dart';
import 'core/routing/router.dart';
import 'core/routing/routes.dart';
import 'core/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  ServiceLocator().init();
  await CacheHelper.init();
  await Hive.initFlutter();
  await HiveInitializer.initializeHive();
  // Future.delayed(const Duration(milliseconds: 1500),() => FlutterNativeSplash.remove(),);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(744, 1113),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: Routes.login,
        navigatorKey: sl<AppRouter>().navigatorKey,
        onGenerateRoute: sl<AppRouter>().generateRoute,
      ), 
    );
  }
}

