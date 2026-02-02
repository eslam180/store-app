import 'package:flutter/material.dart';

 void snackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration :Duration(milliseconds: 4000),
        backgroundColor: Color( 0xff67548E),
        content: Text(message, style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
      ),
    );
  }