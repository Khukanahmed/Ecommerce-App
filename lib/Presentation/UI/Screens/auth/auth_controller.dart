import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
 static String? _token;

  String? get Token => _token;

 static Future<void> setAccessToken(String Token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('access_token', Token);
    _token = Token;


  }

 static Future<void> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString(
      'access_token',
    );
  }

 static bool get isLoggedIn {
    return _token != null;
  }
}
