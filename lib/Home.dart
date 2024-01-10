import 'package:flutter/material.dart';
import 'Component/BottomBar.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.pushNamed(context, '/Test');
            },
            child: const Text('Test'),
          ),
        ],
      )),
      bottomNavigationBar: const BottomBar_(),
    );
  }
}
