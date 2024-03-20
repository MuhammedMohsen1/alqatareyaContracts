import 'package:alqatareyacontracts/core/utils/app_constants.dart';

import 'cache_helper.dart';
import 'cache_keys.dart';

class CacheUtils {
  static Future<void> setRole(String role) async {
    await CacheHelper.putData(key: CacheKeys.role, value: role);
  }

  static Future<void> deleteRole() async {
    await CacheHelper.removeValue(key: CacheKeys.role);
  }

  static Future<String> getRole() async {
    return await CacheHelper.getData(key: CacheKeys.role) ??
        AppRoles.notRegistered;
  }

  static void login() async {
    await CacheHelper.putData(key: CacheKeys.isLogin, value: true);
  }

  static Future<bool> isLoggedIn() async {
    return await CacheHelper.getData(key: CacheKeys.isLogin) ?? false;
  }

  static void signOut() async {
    await CacheHelper.clearCache();
  }

  static Future<String> getUserName() async {
    return await CacheHelper.getData(key: CacheKeys.userName);
  }

  static void setUserName(String name) async {
    await CacheHelper.putData(key: CacheKeys.userName, value: name);
  }
}
