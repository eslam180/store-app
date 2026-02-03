import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/components/snakbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// Future<void> createAcount({
//   required String email,
//   required String password,
//   required String name

// }) async {
//   var auth = FirebaseAuth.instance;
//   await auth.createUserWithEmailAndPassword(
//     email: email.trim(),
//     password: password.trim(),
//   ); String uid = userCredential.user!.uid;
//        await FirebaseFirestore.instance
//     .collection('users')
//     .doc(uid)
//     .set({
//   'name': nameController.text,
//   'email': emailController.text,
 
  
// });

// }





Future<void> createAccount({
  required String email,
  required String password,
  required String name,
}) async {
  // 1️⃣ Create user
  UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  // 2️⃣ Get uid
  String uid = userCredential.user!.uid;

  // 3️⃣ Save user data in Firestore
  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .set({
    'name': name.trim(),
    'email': email.trim(),
 
    
  });
}






Future<void> signInToAccount({
  required String email,
  required String password,
}) async {
  var auth = FirebaseAuth.instance;
  await auth.signInWithEmailAndPassword(email: email, password: password);
}

Future<void> resetAccount({
  required String email,
  required BuildContext context,
}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
    snackBar(context, 'Password reset link sent to your email.');
    Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    snackBar(context, e.message ?? 'Failed to send reset email.');
  }
}
