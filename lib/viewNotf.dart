import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:notify_v1/home.dart';
import 'components/sortWidget.dart';

class viewNotfications extends StatefulWidget {
  final String division;
  final List<ListItem> items;
  const viewNotfications({
    Key? key,
    required this.division,
    required this.items,
  }) : super(key: key);

  @override
  State<viewNotfications> createState() => _viewNotficationsState();
}

class _viewNotficationsState extends State<viewNotfications> {
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
                      builder: (context) => Home(),
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
          title: Text(widget.division),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                SortWidget(
                  items: items,
                  onSort: (sortedItems) {
                    setState(() {
                      items = sortedItems;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                DraggableScrollbarWidget(),
                /*CardList(
                  notSubject: 'CD',
                  notPriority: 4,
                  notIssuedDate: '16-04-2023',
                  notLastDate: '19-04-2023',
                  notTopic: 'SLR Parser',
                  notType: 'Assignment',
                  notDetails:
                      'Submit Home Work as assignment for internal marks',
                ),
                CardList(
                    notSubject: 'CGIP',
                    notPriority: 3,
                    notIssuedDate: '20-04-2023',
                    notLastDate: '25-04-2023',
                    notTopic: 'Module 4',
                    notType: 'Class Test',
                    notDetails: 'Class Test on module 4'),
                CardList(
                    notSubject: 'IEFT',
                    notPriority: 2,
                    notIssuedDate: '28-04-2023',
                    notLastDate: '30-04-2023',
                    notTopic: 'Module 3',
                    notType: 'Class Test',
                    notDetails:
                        'Class Test on module 3. Bring A4 sized paper. Marks to be taken for internal exam'),
                CardList(
                    notSubject: 'CD',
                    notPriority: 4,
                    notIssuedDate: '25-04-2023',
                    notLastDate: '26-04-2023',
                    notTopic: 'Module 3-4',
                    notType: 'Note Submition',
                    notDetails: 'Submit notebook'),
                CardList(
                    notSubject: 'Networking Lab',
                    notPriority: 5,
                    notIssuedDate: '18-04-2023',
                    notLastDate: '20-04-2023',
                    notTopic: 'Cycle 1',
                    notType: 'Class Test',
                    notDetails: 'Lab exam for R6B even batch'),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  CardList({
    required this.notSubject,
    required this.notPriority,
    required this.notLastDate,
    required this.notIssuedDate,
    required this.notTopic,
    required this.notType,
    required this.notDetails,
  });

  int notPriority;
  String notSubject;
  String notIssuedDate;
  String notLastDate;
  String notTopic;
  String notType;
  String notDetails;

  void _showDetails(BuildContext context, String topic, String details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(topic),
          content: Text(details),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Mark as Done'),
              onPressed: () {
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _showDetails(context, notTopic, notDetails);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notSubject,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$notPriority',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                Text(
                  notType,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                Text(
                  notIssuedDate,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                Text(
                  notLastDate,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                Text(
                  notTopic,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
              /*children: subtitles.map((subtitle) {
                return Text(
                  subtitle,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                );
              }).toList(),*/
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )
        /*child: Expanded(
        child: ListView(
          children: [
            ListTile(
              title: Text(notSubject),
              subtitle: Text('$notPriority' +
                  notType +
                  notIssuedDate +
                  notLastDate +
                  notTopic),
            ),
            Divider(),
          ],
        ),
      ),*/

        /*child: Card(
        elevation: 3,
        margin: EdgeInsets.fromLTRB(25, 0, 20, 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  notSubject,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Priority : $notPriority',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Type : $notType',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Issued Date : $notIssuedDate',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Last Date : $notLastDate',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Topic : $notTopic',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),*/
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

  void _showDetails(BuildContext context, List details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Details'),
          content: Text(details[0] + '\n' + details[1]),
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
          itemCount: items.length,
          itemExtent: 100.0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                _showDetails(context, items[index].details);
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
                      items[index].title,
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
