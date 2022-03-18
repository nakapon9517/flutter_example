import 'dart:ui';
import 'package:example/constants.dart';
import 'package:example/utils/size_config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  String id = '';
  String password = '';
  bool _showPassword = false;

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
    final config = SizeConfig(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: config.height(),
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Image.asset(
              "assets/images/vertical-image-min.png",
              fit: BoxFit.cover,
              height: config.height(),
            ),
            Positioned.fill(
              child: Center(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 10.0,
                  ),
                  child: Container(
                    color: Theme.of(context).backgroundColor.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: defaultPadding,
                        bottom: defaultPadding,
                        left: defaultPadding / 2,
                        right: defaultPadding / 2,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2,
                        horizontal: defaultPadding,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:
                            Theme.of(context).backgroundColor.withOpacity(0.6),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'ID',
                          border: InputBorder.none,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        onChanged: (text) {
                          setState(() {
                            id = (text);
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: defaultPadding,
                        left: defaultPadding / 2,
                        right: defaultPadding / 2,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2,
                        horizontal: defaultPadding,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:
                            Theme.of(context).backgroundColor.withOpacity(0.6),
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
                        style: Theme.of(context).textTheme.bodyMedium,
                        onChanged: (text) {
                          setState(() {
                            password = (text);
                          });
                        },
                      ),
                    ),
                  ]),
            ),
          ],
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
