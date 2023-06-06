import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notify_v1/repClasses.dart';
import 'package:notify_v1/settings.dart';

class RepHome extends StatefulWidget {
  const RepHome({Key? key}) : super(key: key);

  @override
  State<RepHome> createState() => _RepHomeState();
}

final _firestore = FirebaseFirestore.instance;
final _auth2 = FirebaseAuth.instance;
dynamic loggedInUser;
late String facultyname;

class ClassItem {
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
  final String id;
  final String classs;
  ClassItem(
      {required this.title,
      required this.details,
      required this.topic,
      required this.issueddate,
      required this.priority,
      required this.submitiondate,
      required this.type,
      required this.facname,
      required this.read,
      required this.rep,
      required this.id,
      required this.classs});
}

List<ClassItem> items = [];

class _RepHomeState extends State<RepHome> {
  @override
  void initState() {
    super.initState();
    GetCurrentUser();
    fetchClassItems();
    // print(items[0].topic);
  }

  void GetCurrentUser() async {
    try {
      final user = await _auth2.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
        fetchCurrentUser(loggedInUser.email);
        print(facultyname);
      }
    } catch (e) {
      print(e);
    }
  }

  void fetchCurrentUser(String Email) async {
    final messages = await _firestore.collection('repsDetails').get();
    for (var message in messages.docs) {
      if (message.get('email') == Email) {
        facultyname = message.get('name');
      }
    }
  }

  void fetchClassItems() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('classData').get();

    final fetchedItems = snapshot.docs.map((doc) {
      final data = doc.data();
      return ClassItem(
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
        classs: data['class'],
        id: doc.id,
      );
    }).toList();

    setState(() {
      items = fetchedItems;
    });
  }

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
                  return RepHome();
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
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        child: new InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Calendar(),
                            //     ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/calendar.png',
                                fit: BoxFit.contain,
                                width: 50,
                              ),
                              SizedBox(
                                height: 10,
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
                      height: 150,
                      width: 150,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        child: new InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => addNotFaculty(),
                            //     ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/plus.png',
                                fit: BoxFit.contain,
                                width: 50,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Add',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RepClasses(
                                    division: facultyname,
                                  ),
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
                              SizedBox(
                                height: 10,
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
                    Container(
                      height: 150,
                      width: 150,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        child: new InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => EditNotificationPage(),
                            //     ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/editing.png',
                                fit: BoxFit.contain,
                                width: 50,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Edit',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
