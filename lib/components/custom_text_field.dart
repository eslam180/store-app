import 'package:flower_app/costants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.onsaved,
    this.onchanged,
    this.controller,
  });
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String hintText;
  final void Function(String?)? onsaved;
  final void Function(String)? onchanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: onsaved,
      onChanged: onchanged,
      controller: controller,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
     
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
prefixIcon:prefixIcon,
        errorStyle: TextStyle(height: 0.7, color: Colors.redAccent),
        hintText: hintText,
        hintStyle: TextStyle(color: kprimaryColor, fontSize: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: kprimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: kprimaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: Colors.redAccent, width: 2),
        ),
      ),
    );
  }
}
