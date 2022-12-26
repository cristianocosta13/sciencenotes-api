import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {

  getInstance(){
    return SharedPreferences.getInstance();
  }

  login() async {
    SharedPreferences sharedPrefs = await getInstance();
    await sharedPrefs.setBool('USER', true);
  }

  logout() async {
    SharedPreferences sharedPrefs = await getInstance();
    await sharedPrefs.setBool('USER', false);
  }

  Future<bool> getUser() async {
    SharedPreferences sharedPrefs = await getInstance();
    bool? active = sharedPrefs.getBool('USER');

    return active ?? false;

  }
}