import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_99915215/Login.dart';
import 'Component/BottomBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Color(0xff242323),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ));
    return Scaffold(
      bottomNavigationBar: const BottomBar_(),
    );
  }
}
