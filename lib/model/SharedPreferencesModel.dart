import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferences? _sharedPreferences;

  SharedPreferences? get sharedPreferences => _sharedPreferences;

  SharedPreferencesService._internal();

  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
