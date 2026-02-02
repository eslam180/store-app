import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/components/create_login_reset_acount.dart';
import 'package:flower_app/components/custom_buttom.dart';
import 'package:flower_app/components/custom_image.dart';
import 'package:flower_app/components/custom_text_field.dart';
import 'package:flower_app/components/snakbar.dart';
import 'package:flower_app/costants.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool ishidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImage(image: 'assets/registerflower.jpg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: kprimaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Name',
                      prefixIcon: Icon(Icons.person, color: kprimaryColor),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      prefixIcon: Icon(Icons.email, color: kprimaryColor),
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      prefixIcon: Icon(Icons.lock, color: kprimaryColor),
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: ishidden,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            ishidden = !ishidden;
                          });
                        },
                        child: Icon(
                          color: kprimaryColor,
                          ishidden ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    CustomButton(
                      nameButtom: 'Register',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await createAcount(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            snackBar(context, 'Account created successfully');

                            Navigator.pop(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              snackBar(context, 'The password is weak');
                            } else if (e.code == 'email-already-in-use') {
                              snackBar(context, 'The email is already in use');
                            } else if (e.code == 'invalid-email') {
                              snackBar(context, 'The email is invalid');
                            }
                          } catch (e) {
                            snackBar(
                              context,
                              'An error occurred while creating the account',
                            );
                          }
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account ?',
                          style: TextStyle(color: kprimaryColor),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: kprimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
