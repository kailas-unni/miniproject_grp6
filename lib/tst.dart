import 'package:flutter/material.dart';

class ListItem {
  final String title;
  final String details;

  ListItem({required this.title, required this.details});
}

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  final List<ListItem> items = [
    ListItem(title: 'Item 1', details: 'Details for Item 1'),
    ListItem(title: 'Item 2', details: 'Details for Item 2'),
    ListItem(title: 'Item 3', details: 'Details for Item 3'),
    ListItem(title: 'Item 4', details: 'Details for Item 4'),
    ListItem(title: 'Item 5', details: 'Details for Item 5'),
    ListItem(title: 'Item 6', details: 'Details for Item 6'),
  ];

  int selectedIndex = 0;

  void _showDetails(BuildContext context, String details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Details'),
          content: Text(details),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              _showDetails(context, items[index].details);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: selectedIndex == index ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    items[index].title,
                    style: TextStyle(
                      color:
                          selectedIndex == index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            HorizontalList(),
            SizedBox(height: 20),
            Text(
              'This is some text that comes after the horizontal list.',
            ),
            SizedBox(height: 20),
            Text(
              'Thanks for using my app!',
            ),
          ],
        ),
      ),
    );
  }
}
