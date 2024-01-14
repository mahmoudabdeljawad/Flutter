import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_99915215/Login.dart';

Future<bool> logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("Auth");
  return true;
}

bool performlogout() {
  bool state = false;
  var stateres = logout().then((res) => {
        // print("res ${res}"),
      });
  // print("statess ${state}");
  return state;
}
