import 'package:flutter/material.dart';
import 'package:notify_v1/home.dart';

class viewNotfications extends StatelessWidget {
  final String division;
  const viewNotfications({Key? key, required this.division}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffe5e5e5),
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
              child: Icon(Icons.arrow_back)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Color(0xff0077b6), Color(0xff0096c7)])),
          ),
          toolbarHeight: 70,
          title: Text('Notification'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  division,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                CardList(
                  notSubject: 'CD',
                  notPriorityLevel: 4,
                  notDate: '19-04-2023',
                  notTopic: 'SLR Parser',
                  notType: 'Assignment',
                  notDetails:
                      'Submit Home Work as assignment for internal marks',
                ),
                CardList(
                    notSubject: 'CGIP',
                    notPriorityLevel: 3,
                    notDate: '25-04-2023',
                    notTopic: 'Module 4',
                    notType: 'Class Test',
                    notDetails: 'Class Test on module 4'),
                CardList(
                    notSubject: 'IEFT',
                    notPriorityLevel: 2,
                    notDate: '30-04-2023',
                    notTopic: 'Module 3',
                    notType: 'Class Test',
                    notDetails:
                        'Class Test on module 3. Bring A4 sized paper. Marks to be taken for internal exam'),
                CardList(
                    notSubject: 'CD',
                    notPriorityLevel: 4,
                    notDate: '26-04-2023',
                    notTopic: 'Module 3-4',
                    notType: 'Note Submition',
                    notDetails: 'Submit notebook'),
                CardList(
                    notSubject: 'Networking Lab',
                    notPriorityLevel: 5,
                    notDate: '20-04-2023',
                    notTopic: 'Cycle 1',
                    notType: 'Class Test',
                    notDetails: 'Lab exam for R6B even batch')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  CardList(
      {required this.notSubject,
      required this.notPriorityLevel,
      required this.notDate,
      required this.notTopic,
      required this.notType,
      required this.notDetails});
  String notSubject;
  int notPriorityLevel;
  String notDate;
  String notTopic;
  String notType;
  String notDetails;

  void _showDetails(BuildContext context, String topic, String details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(topic),
          content: Text(details),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Mark as Done'),
              onPressed: () {
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDetails(context, notTopic, notDetails);
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.fromLTRB(25, 0, 20, 30),
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
                  height: 20,
                ),
                Text(
                  notSubject,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Priority : $notPriorityLevel',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Type : $notType',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Last Date : $notDate',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Topic : $notTopic',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*class showMessage extends StatelessWidget {

  showMessage({
    required this.notTopic1 = notTopic;

});

  String notTopic1;
  String notDetails;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

    );
  }
}*/
