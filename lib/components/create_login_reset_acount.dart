import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/components/snakbar.dart';
import 'package:flutter/material.dart';

Future<void> createAcount({
  required String email,
  required String password,
}) async {
  var auth = FirebaseAuth.instance;
  await auth.createUserWithEmailAndPassword(
    email: email.trim(),
    password: password.trim(),
  );
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
