import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';

const String prefsKeyUserToken = "PREFS_KEY_USER_Token";

class AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferences({
    required this.sharedPreferences,
  });

  Future<void> setUserToken(UserToken userToken) async {
    sharedPreferences.setString(prefsKeyUserToken, userToken);
  }

  Future<UserToken> getUserToken() async {
    return sharedPreferences.getString(prefsKeyUserToken) ?? "";
  }

  Future<void> logout() async {
    sharedPreferences.remove(prefsKeyUserToken);
  }
}
