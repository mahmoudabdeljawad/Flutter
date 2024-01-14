import 'package:test_99915215/Category/AddCategory.dart';
import 'package:test_99915215/Settings.dart';
import 'package:test_99915215/Login.dart';
import 'Home.dart';
import 'package:flutter/material.dart';
import 'Component/ToolBar.dart';
import 'Category/Category.dart';

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
      initialRoute: '/Home',
      routes: {
        '/': (context) => const LoginPage(),
        '/Home': (context) => const HomePage(),
        '/Test': (context) => const Settings(),
        '/CategoryAdd': (context) => const AddCategory(),
      },
    );
  }
}
