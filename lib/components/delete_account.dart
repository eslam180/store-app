import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Delete Account'),
      content: const Text(
        'Are you sure you want to delete your account? This action cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            await deleteAccount(context);
          },
          child: const Text('Delete', style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}

Future<void> deleteAccount(BuildContext context) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return;

  try {
    Navigator.of(context).popUntil((route) => route.isFirst);

    await FirebaseFirestore.instance.collection('users').doc(user.uid).delete();

    await user.delete();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'requires-recent-login') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please re-login to delete your account')),
      );
    }
  }
}
