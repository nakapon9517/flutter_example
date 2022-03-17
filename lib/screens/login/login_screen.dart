import 'package:example/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  String input = '12';
  bool _showPassword = false;
  final items = List<String>.generate(100, (index) => index.toString());

  void _onChangeShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _login() {
    print("login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/horizon-zero-dawn-arrow.jpg",
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                    top: 12,
                  ),
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'ID',
                          border: InputBorder.none,
                        ),
                        onChanged: (text) {
                          setState(() {
                            input = (text);
                          });
                        },
                      ),
                    ),
                  ]),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                    top: 12,
                  ),
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              _onChangeShowPassword();
                            },
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            input = (text);
                          });
                        },
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _login,
        tooltip: 'Login',
        child: const Icon(Icons.login),
      ),
    );
  }
}
