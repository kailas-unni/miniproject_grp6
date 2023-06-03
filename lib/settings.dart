import 'package:flutter/material.dart';

import 'gouri-login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _auth = FirebaseAuth.instance;
  bool _notificationsEnabled = true;
  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure you want to logout?'),
          //content: Text(details),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                _auth.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LogIn(), maintainState: true),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                SwitchListTile(
                  title: Text('Enable notifications'),
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Notification sound',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ListTile(
                  leading: Icon(Icons.volume_up),
                  title: Text('Volume'),
                  subtitle: Text('High'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to sound settings
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.notifications_active),
                  title: Text('Vibration'),
                  subtitle: Text('On'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to vibration settings
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.access_time),
                  title: Text('Quiet hours'),
                  subtitle: Text('10:00 PM - 6:00 AM'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to quiet hours settings
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                // Perform logout action
                _showDetails(context);
              },
              child: Text('Log out'),
            ),
          ),
        ],
      ),
    );
  }
}
