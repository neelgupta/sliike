import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

class ApiHeader {
  static Map<String,String> headers = {
    "Content-Type": "application/json; charset=utf-8",
    "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
  };
}
