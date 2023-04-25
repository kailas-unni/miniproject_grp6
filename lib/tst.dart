import 'package:flutter/material.dart';

import 'components/searchWidget.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        body: SearchButton(),
      ),
    );
  }
}
