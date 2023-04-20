import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {

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
              )
          ),
          //backgroundImage:AssetImage('lib/image/turkey.jpg'),
          body: SafeArea(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 30.0,
                        color:Color.fromARGB(226, 159, 4, 139),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alkatra',
                      ),
                    ),

                    const SizedBox(
                        width: 200.0,
                        child:Divider(
                          color:Colors.white,
                        )
                    ),
                    const Card(
                        color: Colors.white70,
                        margin: EdgeInsets.symmetric(vertical: 40.0,horizontal: 40.0),
                        //padding: EdgeInsets.all(5),
                        child: Padding(
                            padding: EdgeInsets.all(0.05),
                            child: ListTile(
                              leading: Icon(
                                Icons.person,
                                size: 28,
                                color:Color.fromARGB(255, 214, 162, 222),
                              ),
                              title: SizedBox(
                                width: 7.0,
                                height:37.0,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Name',
                                  ),
                                ),
                              ),
                            )
                        )
                    ),
                    const Card(
                        color: Colors.white70,
                        margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 40.0),
                        //padding: EdgeInsets.all(5),
                        child:Padding(
                            padding: EdgeInsets.all(0.05),
                            child: ListTile(
                              leading: Icon(
                                Icons.school,
                                size: 28,
                                color:Color.fromARGB(255, 214, 162, 222),
                              ),
                              title: SizedBox(
                                width: 7.0,
                                height:37.0,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Class',
                                  ),
                                ),
                              ),
                            )
                        )
                    ),
                    const Card(
                        color: Colors.white70,
                        margin: EdgeInsets.symmetric(vertical: 40.0,horizontal: 40.0),
                        //padding: EdgeInsets.all(5),
                        child: Padding(
                            padding: EdgeInsets.all(0.05),
                            child: ListTile(
                              leading: Icon(
                                Icons.email,
                                size: 28,
                                color:Color.fromARGB(255, 214, 162, 222),
                              ),
                              title: SizedBox(
                                width: 7.0,
                                height:37.0,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                  ),
                                ),
                              ),
                            )
                        )
                    ),
                    const Card(
                        color: Colors.white70,
                        margin: EdgeInsets.symmetric(vertical: 7.0,horizontal: 40.0),
                        //padding: EdgeInsets.all(5),
                        child: Padding(
                            padding: EdgeInsets.all(0.05),
                            child: ListTile(
                              leading: Icon(
                                Icons.lock,
                                size: 28,
                                color:Color.fromARGB(255, 214, 162, 222),
                              ),
                              title: SizedBox(
                                width: 7.0,
                                height:37.0,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                  ),
                                ),
                              ),
                            )
                        )
                    ),
                    const Card(
                        color: Colors.white70,
                        margin: EdgeInsets.symmetric(vertical: 35.0,horizontal: 40.0),
                        //padding: EdgeInsets.all(5),
                        child: Padding(
                            padding: EdgeInsets.all(0.05),
                            child: ListTile(
                              leading: Icon(
                                Icons.lock,
                                size: 28,
                                color:Color.fromARGB(255, 214, 162, 222),
                              ),
                              title: SizedBox(
                                width: 7.0,
                                height:37.0,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Confirm Password',
                                  ),
                                ),
                              ),
                            )
                        )
                    ),

                    const SizedBox(
                      height: 20 ,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                            }
                            return null; // Use the component's default.
                          },
                        ),
                      ),
                      child: const Text('Sign Up'),
                      onPressed: () {
                      },
                    ),
                  ]
              )
          )
      ),
    );
  }
}
