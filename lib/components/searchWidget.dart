import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> _wordsList = [
    'apple',
    'banana',
    'cherry',
    'date',
    'elderberry',
    'fig',
    'grape',
    'kiwi',
    'lemon',
    'mango',
  ];

  String _searchQuery = '';

  List<String> get _filteredWordsList {
    return _wordsList
        .where(
            (word) => word.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void _onSearchQueryChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Search Button Example'),
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _onSearchQueryChanged,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredWordsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredWordsList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
