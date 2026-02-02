import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.nameButtom,
    required this.onPressed,
  });
  final void Function()? onPressed;
  final String nameButtom;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
     
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        textStyle: TextStyle(fontSize: 18),
        padding: EdgeInsets.symmetric(vertical: 15),
        minimumSize: Size(double.infinity, 56),
      ),

      child: Text(nameButtom, style: TextStyle(color: Colors.white)),
    );
  }
}
