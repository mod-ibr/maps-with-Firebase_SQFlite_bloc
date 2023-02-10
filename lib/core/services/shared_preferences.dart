import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalSharedPreferences {
  static late SharedPreferences _sharedPreferences;

  // To Check Is that The first run for App to show Splash screen or not
  // static bool isFirstAppRunValue = true;
  static const String _keyIsAppInFirstRun = 'isAppInFirstRun';

  static Future<bool> isFirstAppRun({bool? isFirstRun}) async {
    /// This Function to check if this the first app run
    /// If yes don't show splash screen, and vice versa
    /// Also it takes an optional parameter if it has value
    /// so you want to set the first run of the app  equal to  false,
    /// and  if it equal null so you want to get the saved value
    /// of the first app run is that true  or false from  shared preferences .
    ///Returns bool value

    LocalSharedPreferences._sharedPreferences =
        await SharedPreferences.getInstance();

    // if isFirstRun is != null  so set isFirstRun = false to shared Preferences
    if (isFirstRun != null) {
      _sharedPreferences.setBool(_keyIsAppInFirstRun, isFirstRun);
      return isFirstRun;
    }
    // if isFirstRun is == null  so just return isFirstRun saved value from shared Preferences
    else {
      return _sharedPreferences.getBool(_keyIsAppInFirstRun) ?? true;
    }
   
  }
}
