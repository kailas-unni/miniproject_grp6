import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:notify_v1/home.dart';
import 'components/sortWidget.dart';

List<ListItem> filteredList = [];

class notLog extends StatefulWidget {
  const notLog({Key? key}) : super(key: key);

  @override
  State<notLog> createState() => _notLogState();
}

class _notLogState extends State<notLog> {
  @override
  void initState() {
    super.initState();
    filteredList = items;
  }

  void _searchList(String query) {
    setState(() {
      filteredList = items
          .where((item) =>
              item.title.toLowerCase().contains(query.toLowerCase()) ||
              item.details.toLowerCase().contains(query.toLowerCase()) ||
              item.title.toLowerCase().contains(query.toLowerCase()) ||
              item.topic.toLowerCase().contains(query.toLowerCase()) ||
              item.type.toLowerCase().contains(query.toLowerCase()) ||
              item.priority.toString().contains(query.toLowerCase()) ||
              item.submitiondate.toString().contains(query.toLowerCase()) ||
              item.issueddate.toString().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffe5e5e5),
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Color(0xff0077b6), Color(0xff0096c7)])),
          ),
          toolbarHeight: 70,
          title: Text('Notification Log'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                  child: TextField(
                    onChanged: _searchList,
                    decoration: InputDecoration(
                      hintText: 'Search',
                    ),
                  ),
                ),
                SortWidget(
                  filteredList: filteredList,
                  onSort: (sortedItems) {
                    setState(() {
                      filteredList = sortedItems;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                DraggableScrollbarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DraggableScrollbarWidget extends StatefulWidget {
  @override
  _DraggableScrollbarPageState createState() => _DraggableScrollbarPageState();
}

class _DraggableScrollbarPageState extends State<DraggableScrollbarWidget> {
  final ScrollController _scrollController = ScrollController();

  int selectedIndex = 0;

  void _showDetails(BuildContext context, ListItem details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Details'),
          content: Text('Subject : ' +
              details.title +
              '\n' +
              'Priority : ' +
              details.priority.toString() +
              '\n' +
              'Issued Date : ' +
              details.issueddate.toString() +
              '\n' +
              'Submition Date : ' +
              details.submitiondate.toString() +
              '\n' +
              'Topic : ' +
              details.topic +
              '\n' +
              'Type : ' +
              details.type +
              '\n' +
              'Further Details : ' +
              details.details +
              '\n' +
              'Read : ' +
              details.read.toString()),
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
      height: 700,
      child: DraggableScrollbar.arrows(
        labelTextBuilder: (double offset) => Text("${offset ~/ 100}"),
        controller: _scrollController,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: filteredList.length,
          itemExtent: 100.0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                _showDetails(context, filteredList[index]);
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
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
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: Text(
                      filteredList[index].title,
                      style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
