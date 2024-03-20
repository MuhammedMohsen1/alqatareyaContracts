class HiveUtils {
  // static Future<void> setPreferences(CountryModel model) async {
  //   Hive.box<CountryModel>(HiveKeys.PrefrencesBox)
  //       .put(HiveKeys.preferencesKey, model);
  // }

  // static CountryModel? getPreferences() {
  //   return Hive.box<CountryModel>(HiveKeys.PrefrencesBox)
  //       .get(HiveKeys.preferencesKey);
  // }

  // static Future<void> deletePreferencesData() async {
  //   await Hive.box<CountryModel>(HiveKeys.PrefrencesBox)
  //       .delete(HiveKeys.preferencesKey);
  // }

  // // FOR USER
  // static Future<UserModel?>? setUserDetails(UserModel user) async {
  //   await Hive.box<UserModel>(HiveKeys.userBox).put(HiveKeys.user, user);
  //   return Hive.box<UserModel>(HiveKeys.userBox).get(HiveKeys.user);
  // }

  // static UserModel? getUser() {
  //   return Hive.box<UserModel>(HiveKeys.userBox).get(HiveKeys.user);
  // }

  // static Future<void> deleteUserData() async {
  //   await Hive.box<UserModel>(HiveKeys.userBox).delete(HiveKeys.user);
  // }
}
