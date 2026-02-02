import 'package:flower_app/components/create_login_reset_acount.dart';
import 'package:flower_app/components/custom_buttom.dart';
import 'package:flower_app/components/custom_text_field.dart';
import 'package:flower_app/costants.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Form(
              key: _formKey,
              child: CustomTextField(
                prefixIcon: Icon(Icons.email, color: kprimaryColor),
                hintText: 'Email',
                controller: emailController,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '● We will send you a link to reset your password.',
              style: TextStyle(fontSize: 16,color: kprimaryColor),
            ),
            SizedBox(height: 30),
            CustomButton(
              nameButtom: 'Reset Password',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await resetAccount(
                    email: emailController.text,
                    context: context,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
