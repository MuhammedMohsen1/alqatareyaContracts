import 'package:get_it/get_it.dart';

import '../routing/router.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // Connectivity
    // sl.registerLazySingleton<InternetStatus>(() => InternetStatus(sl()));
    // sl.registerLazySingleton<LocalNotifications>(() => LocalNotifications());
    sl.registerLazySingleton<AppRouter>(
      () => AppRouter(),
    );

    // Error Handling
    // sl.registerLazySingleton<ErrorModel>(() => const ErrorModel());
  }
}
