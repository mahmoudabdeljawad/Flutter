import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_99915215/Functions/CheckAuth.dart';
import 'package:test_99915215/Login.dart';
import 'Component/BottomBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Component/ToolBar.dart';

void main() => runApp(const DashBoard());

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});
  @override
  DashboardStates createState() {
    return DashboardStates();
  }
}

class DashboardStates extends State<DashBoard> {
  String? key;
  User user = User();
  @override
  void initState() {
    super.initState();

    checkisAuth();
    // if (isAuth == false) {
    //   Navigator.pushNamed(context, '/');
    // }
  }

  void checkisAuth() async {
    if (!await checkAuth()) {
      if (!mounted) return;

      Navigator.of(context).pushReplacementNamed("/");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(
        automaticallyImplyLeading: false,
        pageTitile: "Home",
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            child: Center(
                child: ElevatedButton(
              child: Text("Back To Login"),
              onPressed: () => {Navigator.pushNamed(context, '/')},
            )),
          ),
        ]),
      ),
    );
  }
}

//  final ButtonStyle style = ElevatedButton.styleFrom(
//         backgroundColor: const Color(0xff242323),
//         foregroundColor: Colors.white,
//         textStyle: const TextStyle(
//           fontSize: 22,
//           fontWeight: FontWeight.bold,
//         ));
