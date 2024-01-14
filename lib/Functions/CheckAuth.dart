import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_99915215/Login.dart';

Future<bool> checkAuth() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.containsKey("Auth");
}

Future<User> getAuthUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var authCred = prefs.getString("Auth");
  var user = User.fromJson(jsonDecode(authCred.toString()));
  print(user.Id);
  return user;
}
