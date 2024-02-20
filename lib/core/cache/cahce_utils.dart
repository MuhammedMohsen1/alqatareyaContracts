import 'cache_helper.dart';
import 'cache_keys.dart';

class CacheUtils {
  static Future<void> setToken(String token) async {
    await CacheHelper.putData(key: 'token', value: token);
  }

  static String? getToken() {
    return CacheHelper.getData(key: CacheKeys.token);
  }

  static Future<void> deleteToken() async {
    await CacheHelper.removeValue(key: CacheKeys.token);
  }

  static Future<void> setIsOpenedBefore() async {
    await CacheHelper.putData(key: CacheKeys.isOpenedBefore, value: true);
  }

  static bool isOpenedBefore() {
    return CacheHelper.getData(key: CacheKeys.isOpenedBefore) ?? false;
  }

  static bool isLoggedIn() {
    return CacheHelper.getData(key: CacheKeys.token) == null ? false : true;
  }
}
