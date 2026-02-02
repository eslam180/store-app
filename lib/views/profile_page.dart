import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final data = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'profile',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text('● Name:   ${data!.displayName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('● Email:   ${data!.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text(
              '● Created at:  ${DateFormat('d MMM, y').format(data!.metadata.creationTime!)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20,),
            Text(
              '● Last login:   ${DateFormat('d MMM, y',).format(data!.metadata.lastSignInTime!)}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
