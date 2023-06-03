import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notify_v1/gouri-login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late String email;
  late String password;
  late String password1;
  late String name;
  late String batch;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "Notify",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
          //backgroundImage:AssetImage('lib/image/turkey.jpg'),
          body: SafeArea(
              child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(226, 159, 4, 139),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alkatra',
                ),
              ),
              const SizedBox(
                  width: 200.0,
                  child: Divider(
                    color: Colors.white,
                  )),
              Card(
                  color: Colors.white70,
                  margin:
                      EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
                  //padding: EdgeInsets.all(5),
                  child: Padding(
                      padding: EdgeInsets.all(0.05),
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 28,
                          color: Color.fromARGB(255, 214, 162, 222),
                        ),
                        title: SizedBox(
                          width: 7.0,
                          height: 37.0,
                          child: TextField(
                            onChanged: (value) {
                              name = value;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Name',
                            ),
                          ),
                        ),
                      ))),
              Card(
                  color: Colors.white70,
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
                  //padding: EdgeInsets.all(5),
                  child: Padding(
                      padding: EdgeInsets.all(0.05),
                      child: ListTile(
                        leading: Icon(
                          Icons.school,
                          size: 28,
                          color: Color.fromARGB(255, 214, 162, 222),
                        ),
                        title: SizedBox(
                          width: 7.0,
                          height: 37.0,
                          child: TextField(
                            onChanged: (value) {
                              batch = value;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Batch',
                            ),
                          ),
                        ),
                      ))),
              Card(
                  color: Colors.white70,
                  margin:
                      EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
                  //padding: EdgeInsets.all(5),
                  child: Padding(
                      padding: EdgeInsets.all(0.05),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          size: 28,
                          color: Color.fromARGB(255, 214, 162, 222),
                        ),
                        title: SizedBox(
                          width: 7.0,
                          height: 37.0,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ))),
              Card(
                  color: Colors.white70,
                  margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 40.0),
                  //padding: EdgeInsets.all(5),
                  child: Padding(
                      padding: EdgeInsets.all(0.05),
                      child: ListTile(
                        leading: Icon(
                          Icons.lock,
                          size: 28,
                          color: Color.fromARGB(255, 214, 162, 222),
                        ),
                        title: SizedBox(
                          width: 7.0,
                          height: 37.0,
                          child: TextField(
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ))),
              Card(
                  color: Colors.white70,
                  margin:
                      EdgeInsets.symmetric(vertical: 35.0, horizontal: 40.0),
                  //padding: EdgeInsets.all(5),
                  child: Padding(
                      padding: EdgeInsets.all(0.05),
                      child: ListTile(
                        leading: Icon(
                          Icons.lock,
                          size: 28,
                          color: Color.fromARGB(255, 214, 162, 222),
                        ),
                        title: SizedBox(
                          width: 7.0,
                          height: 37.0,
                          child: TextField(
                            obscureText: true,
                            onChanged: (value) {
                              password1 = value;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm Password',
                            ),
                          ),
                        ),
                      ))),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5);
                      }
                      return null; // Use the component's default.
                    },
                  ),
                ),
                child: const Text('Sign Up'),
                onPressed: () async {
                  if (password == password1) {
                    try {
                      final newuer = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if (newuer != Null) {
                        _firestore.collection('userDetails').add(
                            {'name': name, 'batch': batch, 'email': email});
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LogIn();
                        }));
                      }
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(e.toString()),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                      // print(e);
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text("Passwords Don't Match"),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ]),
          ))),
    );
  }
}
