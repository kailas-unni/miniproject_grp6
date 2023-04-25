import 'package:flutter/material.dart';

class ListItem {
  final String title;
  List<String> subtitle;

  ListItem({required this.title, required this.subtitle});
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<ListItem> originalList = [
    ListItem(title: "Apple", subtitle: ["A fruit", "Red or green"]),
    ListItem(title: "Banana", subtitle: ["A fruit", "Yellow"]),
    ListItem(title: "Carrot", subtitle: ["A vegetable", "Orange"]),
    ListItem(title: "Tomato", subtitle: ["A fruit or vegetable", "Red"]),
  ];

  List<ListItem> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = originalList;
  }

  void _searchList(String query) {
    setState(() {
      filteredList = originalList
          .where((item) =>
              item.title.toLowerCase().contains(query.toLowerCase()) ||
              item.subtitle.any(
                  (sub) => sub.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Search List'),
        ),
        body: Column(
          children: [
            TextField(
              onChanged: _searchList,
              decoration: InputDecoration(
                hintText: 'Search',
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredList[index].title),
                    subtitle: Text(filteredList[index].subtitle.join(", ")),
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
