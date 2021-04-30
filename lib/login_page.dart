import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _textController = TextEditingController();

  // final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Center(
              child: Image.asset(
                'graphics/logo.png',
                color: Colors.white70,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    hintStyle: TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    hintStyle: TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              CupertinoButton(
                color: Colors.green[600],
                child: Text('Log In'),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
              TextButton(
                child: Text('Create Account'),
                onPressed: () => print('pressed'),
              )
            ],
          )
        ],
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

  void _handleSubmitted(String text) {
    if (text == 'test') {
      _pushHome();
    }
    print('ERROR: wrong log in credentials - use "test".');
    _textController.clear();
  }
}
