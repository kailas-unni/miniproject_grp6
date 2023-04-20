import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:notify_v1/calendar.dart';
//import 'package:notify_v1/components/scrolllist.dart';
import 'package:notify_v1/notLog.dart';
import 'package:notify_v1/settings.dart';
import 'package:notify_v1/tst.dart';
import 'package:notify_v1/viewNotf.dart';
//import 'package:myapp/log-in/sign-up.dart';
import 'package:select_card/select_card.dart';
import 'package:list_wheel_scroll_view_x/list_wheel_scroll_view_x.dart';

class ListItem {
  final String title;
  final String details;

  ListItem({required this.title, required this.details});
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffe5e5e5),
        appBar: AppBar(
          //backgroundColor: Color(0xffa8dadc),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Color(0xff0077b6), Color(0xff0096c7)])),
          ),
          toolbarHeight: 70,
          title: Image.asset(
            'assets/images/logo.png',
            height: 130,
            width: 130,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.white70,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
              },
              icon: Icon(Icons.settings),
              color: Colors.white70,
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    'Pending Events',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black38.withOpacity(0.25),
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                HorizontalList(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Calendar(),
                                ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/calendar.png'),
                              Text(
                                'Calendar',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 3,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 140,
                      width: 140,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => notLog(),
                                ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/notlog.png',
                              ),
                              Text(
                                'Notification Log',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CardList(
                  notTitle: 'Class',
                  notActive: 6,
                  notTotal: 10,
                ),
                CardList(notTitle: 'Official', notTotal: 12, notActive: 7),
                CardList(notTitle: 'Websites', notTotal: 20, notActive: 9),
              ],
            ),
          ),
        ),

        //body: SafeArea(),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  CardList(
      {required this.notTitle,
      required this.notTotal,
      required this.notActive});
  String notTitle;
  int notTotal;
  int notActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return viewNotfications(
            division: notTitle,
          );
        }));
      },
      child: Card(
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
                  notTitle,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Active : $notActive',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Total : $notTotal',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*class ScrollCard extends StatefulWidget {
  @override
  State<ScrollCard> createState() => _ScrollCardState();
}

class _ScrollCardState extends State<ScrollCard> {
  final List<String> topics = <String>[
    'CD',
    'CGIP',
    'IEFT',
    'CD',
    'Networking Lab',
  ];

  final List<String> priority = <String>[
    '4',
    '3',
    '2',
    '4',
    '5',
  ];

  final List<String> details = <String>[
    'jksafgvhbjvsbv',
    'hjasfgjgfg',
    'jhsfgugfhdfj',
    'gjasfgfhj',
    'hsdfhuhj',
  ];
  String? cardGroupResult;

  String? cardGroupResult2;

  String? cardGroupResult3;

  String? singleCardResult;

  String? selectSlideResult;

  String? selectSlideResult2;

  @override
  Widget okButton = TextButton(onPressed: () {}, child: Text('Ok'));
  Widget markDone = TextButton(
    child: Text("Mark as Done"),
    onPressed: () {},
  );
  Widget build(BuildContext context) {
    return GestureDetector(
      /*onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Calendar(),
            ));
      },*/
      child: Row(
        children: [
          // this single card returns title and id
          SelectGroupCard(context, titles: details, onTap: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Hi'),
                content: Text('Hello World'),
                actions: [
                  okButton,
                  markDone,
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
*/

//---------------------chatgpt horizontal scroll
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
                padding: const EdgeInsets.all(25.0),
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
