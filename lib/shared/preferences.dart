import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  static String _email = '';
  static String _nombre = '';
  static bool _darkmode = false;

  static late SharedPreferences _prefs;

  static Future<void> init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  static String get email{
    return _prefs.getString('email') ?? _email;
  }
  
  static String get nombre{
    return _prefs.getString('nombre') ?? _nombre;
  }
  
  static bool get darkmode{
    return _prefs.getBool('darkmode') ?? _darkmode;
  }

  static set email(String value){
    _email = value;
    _prefs.setString('email', value);
  }
  
  static set nombre(String value){
    _nombre = value;
    _prefs.setString('nombre', value);
  }
 
  static set darkmode(bool value){
    _darkmode = value;
    _prefs.setBool('darkmode', value);
  }


}