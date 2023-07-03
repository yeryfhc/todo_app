import 'package:shared_preferences/shared_preferences.dart';

class TodoSharePreference  {
  static late SharedPreferences _prefs;

static bool _ready=false;

static bool get readytd{
return _prefs.getBool('activo')??_ready;
}

static set readytd(bool value){
  _ready=value;
  _prefs.setBool('activo', value);

}



}