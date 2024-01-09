import 'package:test_99915215/Login.dart';
import 'package:test_99915215/Test.dart';

import 'Home.dart';
import 'package:flutter/material.dart';
import 'Component/ToolBar.dart';

void main() => runApp(const Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/Home': (context) => const HomePage(),
        '/Test': (context) => const TestPage()
      },
    );
  }
}
