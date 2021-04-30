import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
              ),
              onPressed: _pushSettings)
        ],
      ),
      body: TextField(
        controller: _searchController,
        onSubmitted: _handleSearch,
      ),
    );
  }

  void _pushSettings() {
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

  void _handleSearch(String search) async {
    var map = {'name': 'asdasd'};
    final response =
        await http.get(Uri.https('group7-15.pvt.dsv.su.se', '/hello', map));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      print(response.request.toString());
    }
  }
}

class Taxa {
  final String name;

  Taxa({@required this.name});

  factory Taxa.fromJson(Map<String, dynamic> json) {
    return Taxa(
      name: json['title'],
    );
  }
}

Future<Taxa> fetchAlbum() async {
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Taxa.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
