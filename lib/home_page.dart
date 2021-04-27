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
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Center(
              child: Image.asset(
                'graphics/logo.png',
                color: Colors.white,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              textInput('First Name'),
              textInput('Last Name'),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: CupertinoButton.filled(
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
        decoration: InputDecoration(hintText: text),
      ),
    );
  }

  void _pushHome() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: null)
              ],
            ),
          );
        },
      ),
    );
  }
}
