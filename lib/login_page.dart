import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _fnTextController = TextEditingController();
  final _lnTextController = TextEditingController();

  final FocusNode _fnFocusNode = FocusNode();
  final FocusNode _lnFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Center(
                heightFactor: 1.3,
                child: Image.asset(
                  'graphics/logo.png',
                  color: Colors.white70,
                ),
              ),
              Column(
                children: [
                  Container(
                    child: TextField(
                      controller: _fnTextController,
                      onSubmitted: (string) => _handleSubmitted(
                          _fnTextController.text, _lnTextController.text),
                      focusNode: _fnFocusNode,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.white38),
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: TextField(
                      controller: _lnTextController,
                      focusNode: _lnFocusNode,
                      onSubmitted: (string) => _handleSubmitted(
                          _fnTextController.text, _lnTextController.text),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Last Name',
                        hintStyle: TextStyle(color: Colors.white38),
                      ),
                    ),
                  ),
                  CupertinoButton(
                    color: Colors.green[600],
                    child: Text('Log In'),
                    onPressed: () => _handleSubmitted(
                        _fnTextController.text, _lnTextController.text),
                  ),
                  TextButton(
                    child: Text('Create Account'),
                    onPressed: () => print('pressed'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _pushHome() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return HomePage();
        },
      ),
    );
  }

  void _handleSubmitted(String firstName, String lastName) {
    if (lastName.isEmpty) {
      _lnFocusNode.requestFocus();
      return;
    }

    if (firstName == 'test') {
      _pushHome();
    } else {
      print('ERROR: wrong log in credentials - use "test".');
    }
    _fnTextController.clear();
    _lnTextController.clear();
    _fnFocusNode.requestFocus();
  }
}
