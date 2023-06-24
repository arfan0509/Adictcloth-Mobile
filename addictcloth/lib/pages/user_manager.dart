import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  static UserManager? _instance;

  factory UserManager() {
    if (_instance == null) {
      _instance = UserManager._internal();
    }
    return _instance!;
  }

  UserManager._internal();

  String id = '';
  String name = '';
  String email = '';
  String phone_number = '';
  String address = '';
  String api_token = '';

  String get token => api_token;

  void setToken(String token) {
    api_token = token;
  }

  Future<void> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('userData');
    if (userData != null) {
      Map<String, dynamic> userMap = jsonDecode(userData);
      id = userMap['id'].toString();
      name = userMap['name'];
      email = userMap['email'];
      phone_number = userMap['phone_number'];
      address = userMap['address'];
    }
    api_token = prefs.getString('api_token') ??
        ''; // Inisialisasi token dari shared preferences
  }

  Future<void> saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phone_number,
      'address': address,
    };
    String userData = jsonEncode(userMap);
    await prefs.setString('userData', userData);
    await prefs.setString(
        'api_token', api_token); // Simpan token ke shared preferences
  }

  Future<void> clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userData');
    await prefs.remove('token'); // Hapus token dari shared preferences
    id = '';
    name = '';
    email = '';
    phone_number = '';
    address = '';
    api_token = ''; // Reset nilai token
  }
}
