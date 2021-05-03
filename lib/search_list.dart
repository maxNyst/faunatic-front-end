import 'package:english_words/english_words.dart';
import 'package:faunatic_front_end/search_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  // final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = TextStyle(fontSize: 18.0);
  final _searchController = TextEditingController();
  final _focus = FocusNode();
  final _searchItemList = <SearchItem>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _searchController,
              focusNode: _focus,
              onSubmitted: _handleSearch,
              decoration: InputDecoration(
                hintText: 'Search for a species',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
              child:
                  _searchItemList.isEmpty ? Center(child: Text('IMPLEMENTERA SNURRANDE SÖKIKON')) : _buildSuggestions()),
        ],
      ),
    );
  }

  void _handleSearch(String string) async {
    var map = {'term': _searchController.text};
    _searchController.clear();
    _focus.requestFocus();
    _searchItemList.clear();
    setState(() {});

    final response =
        await http.get(Uri.https('group7-15.pvt.dsv.su.se', '/search', map));

    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> list = jsonDecode(response.body);
      for (var i in list) {
        _searchItemList.add(SearchItem.fromJson(i));
      }
    } else {
      print(response.request.toString());
    }
    setState(() {});
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _saved.map((WordPair pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          });
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: _searchItemList.length,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          // if (index >= _suggestions.length) {
          //   _suggestions.addAll(generateWordPairs().take(10));
          // }
          return _buildRow(_searchItemList[index]);
        });
  }

  Widget _buildRow(SearchItem item) {
    final alreadySaved = _saved.contains(item);

    return ListTile(
      title: Text(
        item.toString(),
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      // onTap: () => setState(
      //   () {
      //     if (alreadySaved)
      //       _saved.remove(item);
      //     else
      //       _saved.add(item);
      //   },
      // ),
    );
  }
}
