import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notify_v1/calendar.dart';
import 'package:notify_v1/components/searchWidget.dart';
//import 'package:notify_v1/components/scrolllist.dart';
import 'package:notify_v1/notLog.dart';
import 'package:notify_v1/settings.dart';
import 'package:notify_v1/tst.dart';
import 'package:notify_v1/viewNotf.dart';
//import 'package:myapp/log-in/sign-up.dart';
import 'package:select_card/select_card.dart';
import 'package:notify_v1/remidnerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:notify_v1/viewOfficalNotf.dart';

class ListItem {
  final String title;
  final String details;
  final String topic;
  final String type;
  final int priority;
  final String facname;
  final String issueddate;
  final String submitiondate;
  final bool read;
  final String rep;
  ListItem(
      {required this.title,
      required this.details,
      required this.topic,
      required this.issueddate,
      required this.priority,
      required this.submitiondate,
      required this.type,
      required this.facname,
      required this.read,
      required this.rep});
}

List<ListItem> items = [];
List<ListItem> moditems = [];

class OfficialItem {
  final String details;
  final String title;
  final String topic;
  final int priority;
  final String issueddate;
  final String submitiondate;
  final String facname;
  final bool read;
  final String classs;
  OfficialItem(
      {required this.title,
      required this.details,
      required this.topic,
      required this.issueddate,
      required this.priority,
      required this.submitiondate,
      required this.facname,
      required this.read,
      required this.classs});
}

List<OfficialItem> officialitems = [];

int countClass = 0;
int countOfficial = 0;

// List<ListItem> items = [
//   ListItem(title: 'Assignment', details: [
//     'CD',
//     '4',
//     '16-04-2023',
//     '19-04-2023',
//     'SLR Parser',
//     'Assignment',
//     'Submit Home Work as assignment for internal marks'
//   ]),
//   ListItem(title: 'Class Test', details: [
//     'CGIP',
//     '3',
//     '20-04-2023',
//     '25-04-2023',
//     'Module 4',
//     'Class Test',
//     'Class Test on module 4'
//   ]),
//   ListItem(title: 'Class Test', details: [
//     'IEFT',
//     '2',
//     '28-04-2023',
//     '30-04-2023',
//     'Module 3',
//     'Class Test',
//     'Class Test on module 3. Bring A4 sized paper. Marks to be taken for internal exam'
//   ]),
//   ListItem(title: 'Note Submition', details: [
//     'CD',
//     '4',
//     '25-04-2023',
//     '26-04-2023',
//     'Module 3-4',
//     'Note Submition',
//     'Submit notebook'
//   ]),
//   ListItem(title: 'Class Test', details: [
//     'Networking Lab',
//     '5',
//     '18-04-2023',
//     '20-04-2023',
//     'Cycle 1',
//     'Class Test',
//     'Lab exam for R6B even batch'
//   ]),
//   /*ListItem(title: 'Item 1', details: ['Details for Item 6', 'hi']),
//   ListItem(title: 'Item 7', details: ['Details for Item 7', 'hi']),
//   ListItem(title: 'Item 8', details: ['Details for Item 8', 'hi']),
//   ListItem(title: 'Item 9', details: ['Details for Item 9', 'hi']),
//   ListItem(title: 'Item 1', details: ['Details for Item 10', 'hi']),
//   ListItem(title: 'Item 11', details: ['Details for Item 11', 'hi']),
//   ListItem(title: 'Item 12', details: ['Details for Item 12', 'hi']),*/
// ];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
dynamic loggedInUser;

class _HomeState extends State<Home> {
  // This widget is the root of your application.

  void initState() {
    super.initState();
    GetCurrentUser();
    fetchOfficialItems();
    countData();
    NextDay();
  }

  void NextDay() {
    moditems.clear();
    DateTime now = DateTime.now();
    DateTime issuedDate = now.add(Duration(days: 3));
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(issuedDate);
    for (int i = 0, j = 0; i < items.length; i++) {
      if ((DateTime.parse(items[i].submitiondate)
          .isBefore(DateTime.parse(formattedDate)))) {
        moditems.add(items[i]);
        j++;
      }
    }
  }

  void GetCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure you want to logout?'),
          //content: Text(details),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                _showDetails(context);
              },
            ),
          ],
        );
      },
    );
  }

  // void fetchClassItems() async {
  //   final snapshot =
  //       await FirebaseFirestore.instance.collection('classData').get();
  //
  //   final fetchedItems = snapshot.docs.map((doc) {
  //     final data = doc.data();
  //     return ListItem(
  //       title: data['subject'],
  //       details: data['details'],
  //       topic: data['topic'],
  //       type: data['type'],
  //       priority: data['priority'],
  //       issueddate: data['issueddate'].toDate(),
  //       submitiondate: data['submitiondate'].toDate(),
  //       read: data['read'],
  //     );
  //   }).toList();
  //
  //   setState(() {
  //     items = fetchedItems;
  //   });
  // }

  void fetchOfficialItems() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('officialData').get();

    final fetchedItems = snapshot.docs.map((doc) {
      final data = doc.data();
      return OfficialItem(
        title: data['title'],
        details: data['details'],
        topic: data['topic'],
        priority: data['priority'],
        issueddate: data['issueddate'],
        submitiondate: data['submitiondate'],
        read: data['read'],
        facname: data['facname'],
        classs: data['class'],
      );
    }).toList();

    setState(() {
      officialitems = fetchedItems;
    });
  }

  void countData() {
    countClass = 0;
    countOfficial = 0;
    for (var i = 0; i < items.length; i++) {
      if (items[i].read == false) {
        print("hellooo");
        countClass++;
      }
    }
    for (var i = 0; i < officialitems.length; i++) {
      if (officialitems[i].read == false) {
        print("hiiii");
        countOfficial++;
      }
    }
  }

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
          toolbarHeight: 60,
          title: Image.asset(
            'assets/images/logo.png',
            height: 120,
            width: 120,
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Navigator.pop(context); // pop current page
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
              icon: Icon(Icons.refresh),
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
                MessageStream(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    'Pending Events',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Class',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                HorizontalList(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Official',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                HorizontalList1(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
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
                              Image.asset(
                                'assets/images/calendar.png',
                                fit: BoxFit.contain,
                                width: 50,
                              ),
                              Text(
                                'Calendar',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 13),
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
                    Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReminderPage(),
                                ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/reminder.png',
                                fit: BoxFit.contain,
                                width: 50,
                              ),
                              Text(
                                'Reminders',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 13),
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
                    Container(
                      height: 100,
                      width: 100,
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
                                fit: BoxFit.contain,
                                width: 50,
                              ),
                              Text(
                                'Notification Log',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 13),
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
                  notActive: countClass,
                  notTotal: items.length,
                ),
                CardList(
                    notTitle: 'Official',
                    notActive: countOfficial,
                    notTotal: officialitems.length),
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
        if (notTitle == "Class") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return viewNotfications(
              division: notTitle,
              items: items,
            );
          }));
        }
        if (notTitle == "Official") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return viewOfficialNotfications(
              division: notTitle,
              officialitems: officialitems,
            );
          }));
        }
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.fromLTRB(25, 0, 20, 25),
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
                  height: 10,
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
                  height: 10,
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
  int selectedIndex = 0;

  void initState() {
    super.initState();
  }

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
              details.issueddate +
              '\n' +
              'Submition Date : ' +
              details.submitiondate +
              '\n' +
              'Topic : ' +
              details.topic +
              '\n' +
              'Type : ' +
              details.type +
              '\n' +
              'Faculty Name : ' +
              details.facname +
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
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moditems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              _showDetails(context, moditems[index]);
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
                    moditems[index].title + '\n' + moditems[index].type,
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

//---------------------chatgpt horizontal scroll
class HorizontalList1 extends StatefulWidget {
  @override
  _HorizontalListState1 createState() => _HorizontalListState1();
}

class _HorizontalListState1 extends State<HorizontalList1> {
  int selectedIndex = 0;

  void _showDetails(BuildContext context, OfficialItem details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Details'),
          content: Text('Title : ' +
              details.title +
              '\n' +
              'Priority : ' +
              details.priority.toString() +
              '\n' +
              'Class : ' +
              details.classs +
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
              'Faculty Name : ' +
              details.facname +
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
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: officialitems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              _showDetails(context, officialitems[index]);
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
                    officialitems[index].title +
                        '\n' +
                        officialitems[index].topic,
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

class MessageStream extends StatefulWidget {
  @override
  _MessageStreamState createState() => _MessageStreamState();
}

class _MessageStreamState extends State<MessageStream> {
  @override
  void initState() {
    super.initState();
    fetchClassItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void fetchClassItems() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('classData').get();

    final fetchedItems = snapshot.docs.map((doc) {
      final data = doc.data();
      return ListItem(
        title: data['subject'],
        details: data['details'],
        topic: data['topic'],
        type: data['type'],
        priority: data['priority'],
        issueddate:
            DateFormat('yyyy-MM-dd HH:mm').format(data['issueddate'].toDate()),
        submitiondate: DateFormat('yyyy-MM-dd HH:mm')
            .format(data['submitiondate'].toDate()),
        read: data['read'],
        facname: data['facname'],
        rep: data['rep'],
      );
    }).toList();

    setState(() {
      items = fetchedItems;
    });
  }
}

// for (var event in events!) {
// // final messageText = message.data()['text'];
// // final messageSender = message.data()['sender'];
// bool flag = false;
// for (String facultyMails in event.data()['FacultIies Involved']) {
// if ((loggedInUser.email == facultyMails) &&
// (event.data()['FacultIies Involved'].last != facultyMails)) {
// flag = true;
// }
// if ((event.data()['Status'] != 'ONGOING') &&
// (event.data()['FacultIies Involved'].last == facultyMails) &&
// (loggedInUser.email == facultyMails)) {
// flag = true;
// }
// }
// if (loggedInUser.email == event.data()['Generated User'] || flag) {
// final eventCard = EventCard(
// eventTitle: event.data()['Event Name'],
// eventId: event.data()['ID'].toString(),
// date: event.data()['Date'],
// student: event.data()['Generated User'],
// eventstatus: event.data()['Status'],
// nextpage: Student_Faculty_event_details(
// name: event.data()['Event Name'],
// id: event.data()['ID'].toString(),
// date: event.data()['Date'],
// student: event.data()['Generated User'],
// eventStartTime: event.data()['Event Start Time'],
// eventEndTime: event.data()['Event End Time'],
// venue: event.data()['Venue'],
// description: event.data()['Event Description'],
// facultiesInvolved: event.data()['FacultIies Involved'],
// status: event.data()['Status'],
// userType: event.data()['User Type'],
// ),
// context: context);
// EventRequests.add(eventCard);
// }
// }
