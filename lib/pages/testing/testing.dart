import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Testing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseMessaging.instance.getToken().then((value) => print(value));

          // await FirebaseMessaging.instance.subscribeToTopic('retensi');
        },
        child: Text('Generate'),
      ),
      body: Center(
        child: Container(
          child: Text('sss'),
        ),
      ),
    );
  }
}
