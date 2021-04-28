import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              textInput('First Name'),
              textInput('Last Name'),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: CupertinoButton(
                  color: Colors.green[600],
                  child: Text('Log In'),
                  onPressed: _pushHome,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget textInput(String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
            hintText: text,
          hintStyle: TextStyle(
              color: Colors.white38
          ),
        ),
      ),
    );
  }

  void _pushHome() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.settings,
                    ),
                    onPressed: pushSettings)
              ],
            ),
          );
        },
      ),
    );
  }

  void pushSettings() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
          );
        },
      ),
    );
  }
}
