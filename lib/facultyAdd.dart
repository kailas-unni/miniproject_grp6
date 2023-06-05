import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notify_v1/facultyHome.dart';

class addNotFaculty extends StatefulWidget {
  @override
  _addNotFacultyState createState() => _addNotFacultyState();
}

class _addNotFacultyState extends State<addNotFaculty> {
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  DateTime? _submissionDate;

  CollectionReference _officialDataCollection =
      FirebaseFirestore.instance.collection('officialData');

  List<String> notifications = [];

  @override
  void dispose() {
    _classController.dispose();
    _titleController.dispose();
    _topicController.dispose();
    _detailsController.dispose();
    _priorityController.dispose();
    super.dispose();
  }

  void _addNotification() async {
    String className = _classController.text;
    String title = _titleController.text;
    String topic = _topicController.text;
    String details = _detailsController.text;
    String priority = _priorityController.text;
    String issuedDate;
    String submissionDate =
        DateFormat('yyyy-MM-dd HH:mm').format(_submissionDate!);

    // Perform any validation or data processing here

    DateTime now = DateTime.now();
    issuedDate = DateFormat('yyyy-MM-dd HH:mm').format(now);

    String notification =
        "Class: $className\nTitle: $title\nTopic: $topic\nDetails: $details\nPriority: $priority\nDate: $submissionDate";

    await _officialDataCollection.add({
      'class': className,
      'title': title,
      'topic': topic,
      'details': details,
      'priority': int.parse(priority),
      'submitiondate': submissionDate,
      'issueddate': issuedDate,
      'facname': facultyname,
      'read': false,
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Data added successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    setState(() {
      // notifications.add(notification);
      _classController.clear();
      _titleController.clear();
      _topicController.clear();
      _detailsController.clear();
      _priorityController.clear();
      _submissionDate = null;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        setState(() {
          _submissionDate = DateTime(
            picked.year,
            picked.month,
            picked.day,
            selectedTime.hour,
            selectedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _classController,
              decoration: InputDecoration(labelText: 'Class'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _topicController,
              decoration: InputDecoration(labelText: 'Topic'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _detailsController,
              decoration: InputDecoration(labelText: 'Details'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _priorityController,
              decoration: InputDecoration(labelText: 'Priority'),
            ),
          ),
          ListTile(
            title: Text(
              _submissionDate != null
                  ? DateFormat('yyyy-MM-dd HH:mm').format(_submissionDate!)
                  : 'Select Submission Date',
            ),
            onTap: () {
              _selectDate(context);
            },
          ),
          ElevatedButton(
            onPressed: _addNotification,
            child: Text('Add'),
          ),
          SizedBox(height: 16.0),
          ...notifications.map((notification) => ListTile(
                title: Text(notification),
              )),
        ],
      ),
    );
  }
}
