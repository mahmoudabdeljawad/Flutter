import 'package:flutter/material.dart';

void main() => runApp(const TestPage());

class TestPage extends StatelessWidget {
  const TestPage({super.key});
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: Color(0xff242323),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ));
    return Scaffold(
      body: Container(
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          child: const Text('Logout!'),
        ),
      ),
    );
  }
}
