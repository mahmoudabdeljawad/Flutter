import 'package:flutter/material.dart';
import 'Component/ToolBar.dart';
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
        bottomNavigationBar: const BottomBar_(),
        // appBar:
        // const ToolBar(pageTitile: 'Home', automaticallyImplyLeading: true),
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
        )));
  }
}

// class _HeaderLogin extends StatelessWidget {
//   const _HeaderLogin({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 250.0,
//         decoration: new BoxDecoration(
//           color: Color(0xff011447),
//           boxShadow: [new BoxShadow(blurRadius: 50.0)],
//           borderRadius: new BorderRadius.vertical(
//               bottom: new Radius.elliptical(
//                   MediaQuery.of(context).size.width, 190.0)),
//         ));
//   }
// }
