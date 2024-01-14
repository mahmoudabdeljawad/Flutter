import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_99915215/Functions/CheckAuth.dart';

class User {
  String? email;
  String? password;
  int? Id;

  User({this.email, this.password});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    Id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['id'] = this.Id;

    return data;
  }
}

void main() => runApp(const LoginPage());

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // performAuthCheck();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff000000),
        toolbarHeight: 200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom:
                new Radius.elliptical(MediaQuery.of(context).size.width, 53.0),
          ),
        ),
      ), // Your app bar
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 33,
          horizontal: 22,
        ),
        child: const LoginFormWidget(),
      ), // Your body,
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
  String? name;
  User user = User(email: "", password: "");

  @override
  void initState() {
    super.initState();
    alredylogin();
  }

  void alredylogin() async {
    if (await checkAuth()) {
      if (!mounted) {
        return;
      }
      Navigator.of(context).pushReplacementNamed('/Home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 22),
              child: Center(
                child: Text(
                    style: TextStyle(
                        fontSize: 44,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold),
                    "Login"),
              ),
            ),
            Container(
                child: TextFormField(
                    onChanged: (value) => {
                          setState(() {
                            user.email = value;
                          })
                        },
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
                      } else if (!EmailValidator.validate(value.toString())) {
                        return 'Invalid Email';
                      }
                      return null;
                    })),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TextFormField(
                onChanged: (value) => {
                  setState(() {
                    user.password = value;
                  })
                },
                obscureText: true,
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
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 33),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(2), top: Radius.circular(2)),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      // Make a POST request to a dummy endpoint
                      Uri url =
                          Uri.parse('https://localhost:7243/api/Home/Login');
                      final body = jsonEncode(user.toJson());

                      try {
                        final response = await http.post(
                          url,
                          headers: {
                            "Content-type": "application/json",
                            "Accept": "application/json"
                          },
                          body:
                              body, // Pass the map directly, http.post will handle the conversion
                        );

                        if (response.statusCode == 200) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          // Handle success
                          await prefs.setString("Auth", response.body);
                          // SessionManager().setString("key", response.body);
                          Navigator.pushNamed(
                            context,
                            '/Home',
                          );
                        } else {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Wrong Email Or Password'),
                            ),
                          );
                        }
                      } catch (error) {}
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
      ),
    );
  }
}

class _HeaderLogin extends StatelessWidget {
  const _HeaderLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250.0,
        decoration: new BoxDecoration(
          color: const Color(0xff011447),
          boxShadow: [new BoxShadow(blurRadius: 50.0)],
          borderRadius: new BorderRadius.vertical(
              bottom: new Radius.elliptical(
                  MediaQuery.of(context).size.width, 190.0)),
        ));
  }
}
