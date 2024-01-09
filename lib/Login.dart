import 'package:flutter/material.dart';
import 'Component/ToolBar.dart';

void main() => runApp(const LoginPage());

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff242323),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 100,
          fontWeight: FontWeight.bold,
          height: 3,
        ));
    return Scaffold(
      appBar:
          const ToolBar(pageTitile: 'Login', automaticallyImplyLeading: false),
      body: Container(
        child: Center(
          child: Container(
            width: 300,
            height: 400,
            child: const LoginFormWidget(),
          ),
        ),
      ),
    );
  }
}

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  LoginPageForm createState() {
    return LoginPageForm();
  }
}

class LoginPageForm extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                errorStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Requierd Field';
                }
                return null;
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                errorStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Requierd Field';
                } //else if (EmailValidator.validate(value)) {}
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 33),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(2), top: Radius.circular(2)),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    Navigator.pushNamed(context, '/Home');
                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
