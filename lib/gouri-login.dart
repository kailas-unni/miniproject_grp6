import 'package:flutter/material.dart';
import 'package:notify_v1/gouri-signup.dart';
import 'package:notify_v1/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          //backgroundImage:AssetImage('lib/image/turkey.jpg'),

          body: SafeArea(
              child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              Image(
                image: AssetImage('assets/log-in/images/logo.png'),
                width: 300,
                height: 300,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(226, 159, 4, 139),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alkatra',
                ),
              ),
              SizedBox(
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
                          Icons.person_pin_rounded,
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
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
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
              SizedBox(
                height: 80,
              ),
              Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Color(0xff0077b6), Color(0xff90e0ef)]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    child: const Text('Login'),
                    onPressed: () async {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != Null) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Home();
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
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(0.0),
                    textStyle: const TextStyle(fontSize: 10),
                  ),
                  onPressed: () {},
                  child: const Text('Forgot password?'),
                ),
              ),
              SizedBox(
                height: 20,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(0.0),
                    textStyle: const TextStyle(fontSize: 10),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUp();
                    }));
                  },
                  child: const Text('New User? Sign Up'),
                ),
              ),
            ]),
          ))),
    );
  }
}
