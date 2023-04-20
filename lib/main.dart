import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notify_v1/home.dart';
import 'package:notify_v1/log-in.dart';

//Time Zone initialization

void main() {
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
