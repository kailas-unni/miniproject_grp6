import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:notify_v1/facultyEdit.dart';
import 'package:notify_v1/facultyHome.dart';
import 'components/sortFacultyClassWidget.dart';

List<ClassItem> filteredList = [];

class FacultyClasses extends StatefulWidget {
  final String division;
  const FacultyClasses({
    Key? key,
    required this.division,
  }) : super(key: key);

  @override
  State<FacultyClasses> createState() => _FacultyClassesState();
}

class _FacultyClassesState extends State<FacultyClasses> {
  void initState() {
    super.initState();
    filteredList =
        items.where((item) => item.facname == widget.division).toList();
  }

  void _searchList(String query) {
    setState(() {
      filteredList = items
          .where((item) =>
              item.title.toLowerCase().contains(query.toLowerCase()) ||
              item.details.toLowerCase().contains(query.toLowerCase()) ||
              item.topic.toLowerCase().contains(query.toLowerCase()) ||
              item.priority.toString().contains(query.toLowerCase()) ||
              item.submitiondate.toString().contains(query.toLowerCase()) ||
              item.issueddate.toString().contains(query.toLowerCase()))
          .where((item) => item.facname == widget.division)
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminHome(),
                    ));
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
          title: Text("Logs"),
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
                SizedBox(
                  height: 20,
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

  void _showDetails(BuildContext context, ClassItem details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Details'),
          content: Text('Subject : ' +
              details.title +
              '\n' +
              'Class : ' +
              details.batch +
              '\n' +
              'Faculty : ' +
              details.facname +
              '\n' +
              'Priority : ' +
              details.priority.toString() +
              '\n' +
              'Issued Date : ' +
              details.issueddate +
              '\n' +
              'Submition Date : ' +
              details.submitiondate +
              '\n' +
              'Topic : ' +
              details.topic +
              '\n' +
              'Further Details : ' +
              details.details +
              '\n' +
              'Read : ' +
              details.read.toString()),
          actions: <Widget>[
            TextButton(
              child: Text('Edit'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditNotificationPage(
                    division: details.id,
                  );
                }));
              },
            ),
            TextButton(
              child: Text('Ok'),
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
