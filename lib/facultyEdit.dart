import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notify_v1/facultyHome.dart';

class EditNotificationPage extends StatefulWidget {
  final String division;

  EditNotificationPage({required this.division});

  @override
  _EditNotificationPageState createState() => _EditNotificationPageState();
}

DocumentSnapshot<Map<String, dynamic>>? notification = null;

class _EditNotificationPageState extends State<EditNotificationPage> {
  late TextEditingController _classController;
  late TextEditingController _titleController;
  late TextEditingController _topicController;
  late TextEditingController _detailsController;
  late TextEditingController _priorityController;
  DateTime? _submissionDate;

  CollectionReference _officialDataCollection =
      FirebaseFirestore.instance.collection('officialData');

  @override
  void initState() {
    super.initState();
    fetchDocument();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDocumentSnapshot(
      String documentId) async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('officialData');
    DocumentSnapshot<Object?> documentSnapshot =
        await collection.doc(documentId).get();
    return documentSnapshot as DocumentSnapshot<Map<String, dynamic>>;
  }

  void fetchDocument() async {
    String documentId = widget.division;
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await getDocumentSnapshot(documentId);
    setState(() {
      notification = documentSnapshot;
      _classController = TextEditingController(text: notification!['class']);
      _titleController = TextEditingController(text: notification!['title']);
      _topicController = TextEditingController(text: notification!['topic']);
      _detailsController =
          TextEditingController(text: notification!['details']);
      _priorityController =
          TextEditingController(text: notification!['priority']?.toString());
      _submissionDate = DateTime.parse(notification!['submitiondate']);
    });
  }

  void dispose() {
    _classController.dispose();
    _titleController.dispose();
    _topicController.dispose();
    _detailsController.dispose();
    _priorityController.dispose();
    super.dispose();
  }

  void _updateNotification() async {
    String className = _classController.text;
    String title = _titleController.text;
    String topic = _topicController.text;
    String details = _detailsController.text;
    String priority = _priorityController.text;
    String submissionDate =
        DateFormat('yyyy-MM-dd HH:mm').format(_submissionDate!);

    // Perform any validation or data processing here

    if (notification != null && notification!.reference != null) {
      await notification!.reference.update({
        'class': className,
        'title': title,
        'topic': topic,
        'details': details,
        'priority': int.parse(priority),
        'submitiondate': submissionDate,
      });
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Data updated successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return AdminHome();
                }));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

//-----------------------
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
    if (_classController == null ||
        _titleController == null ||
        _topicController == null ||
        _detailsController == null ||
        _priorityController == null) {
      return CircularProgressIndicator(); // or any other loading indicator
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Notification'),
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
            onPressed: _updateNotification,
            child: Text('Update'),
          ),
        ],
      ),
    );
  }
}
