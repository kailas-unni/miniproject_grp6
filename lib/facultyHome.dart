import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notify_v1/facultyClasses.dart';
import 'package:notify_v1/settings.dart';
import 'facultyAdd.dart';
import 'package:notify_v1/facultyEdit.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

final _firestore = FirebaseFirestore.instance;
final _auth1 = FirebaseAuth.instance;
dynamic loggedInUser;
late String facultyname;

class ClassItem {
  final String batch;
  final String title;
  final String details;
  final String topic;
  final int priority;
  final String facname;
  final String issueddate;
  final String submitiondate;
  final bool read;
  final String id;
  ClassItem(
      {required this.title,
      required this.batch,
      required this.details,
      required this.topic,
      required this.issueddate,
      required this.priority,
      required this.submitiondate,
      required this.facname,
      required this.read,
      required this.id});
}

List<ClassItem> items = [];

class _AdminHomeState extends State<AdminHome> {
  @override
  void initState() {
    super.initState();
    GetCurrentUser();
    fetchClassItems();
    // print(items[0].topic);
  }

  void GetCurrentUser() async {
    try {
      final user = await _auth1.currentUser;
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
    final messages = await _firestore.collection('facultyDetails').get();
    for (var message in messages.docs) {
      if (message.get('email') == Email) {
        facultyname = message.get('name');
      }
    }
  }

  void fetchClassItems() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('officialData').get();

    final fetchedItems = snapshot.docs.map((doc) {
      final data = doc.data();
      return ClassItem(
        title: data['title'],
        batch: data['class'],
        details: data['details'],
        topic: data['topic'],
        priority: data['priority'],
        issueddate: data['issueddate'],
        submitiondate: data['submitiondate'],
        read: data['read'],
        facname: data['facname'],
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
                  return AdminHome();
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => addNotFaculty(),
                                ));
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
                                  builder: (context) => FacultyClasses(
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
