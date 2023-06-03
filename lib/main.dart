import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notify_v1/gouri-login.dart';
import 'package:flutter/services.dart';
import 'package:notify_v1/home.dart';
import 'package:firebase_core/firebase_core.dart';

//Time Zone initialization

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyLarge: GoogleFonts.montserrat(textStyle: textTheme.bodyLarge),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LogIn(),
    );
  }
}
