// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_core/firebase_core.dart'; //new
import 'package:firebase_auth/firebase_auth.dart'; //new

import 'package:faunatic_front_end/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(

        ),

        primaryColor: Colors.green[400],
        scaffoldBackgroundColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: Colors.white70)),
      ),
      home: Login(),
    );
  }
}
