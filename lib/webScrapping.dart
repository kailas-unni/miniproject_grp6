import 'package:flutter/material.dart';

class WebScrap extends StatefulWidget {
  const WebScrap({Key? key}) : super(key: key);

  @override
  State<WebScrap> createState() => _WebScrapState();
}

class _WebScrapState extends State<WebScrap> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xffe5e5e5),
      appBar: AppBar(
        leading: InkWell(onTap: () {}, child: Icon(Icons.arrow_back)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Color(0xff0077b6), Color(0xff0096c7)])),
        ),
        toolbarHeight: 70,
        title: Text("Web Notifications"),
      ),
    ));
  }
}
