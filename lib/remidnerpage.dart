import 'package:flutter/material.dart';
import 'package:notify_v1/home.dart';
import 'package:notify_v1/notLogDialog.dart';

List<ListItem> filteredList = [];

class ReminderPage extends StatefulWidget {
  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  @override
  void initState() {
    super.initState();
    filteredList = items;
  }

  void openNotificationLogDialog(BuildContext context) async {
    final List<ListItem> items =
        filteredList; // Replace with your list of items

    final selectedItem = await showDialog<ListItem>(
      context: context,
      builder: (BuildContext context) {
        return NotificationLogDialog(items: items);
      },
    );

    // Handle the selected item here
    if (selectedItem != null) {
      // Do something with the selected item
      print('Selected item: ${selectedItem.title}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ReminderCard(
            title: 'Reminder 1',
            priority: 'High',
            onDelete: () {
              // Delete reminder
            },
            onEdit: () {
              // Edit reminder
            },
          ),
          SizedBox(height: 16.0),
          ReminderCard(
            title: 'Reminder 2',
            priority: 'Medium',
            onDelete: () {
              // Delete reminder
            },
            onEdit: () {
              // Edit reminder
            },
          ),
          // Add more ReminderCard widgets as needed
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          openNotificationLogDialog(context);
          print(items);
          // Add new reminder
        },
      ),
    );
  }
}

class ReminderCard extends StatelessWidget {
  final String title;
  final String priority;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ReminderCard({
    required this.title,
    required this.priority,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(
          'Priority: $priority',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
        onTap: onEdit,
      ),
    );
  }
}
