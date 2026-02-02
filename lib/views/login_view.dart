import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/components/create_login_reset_acount.dart';
import 'package:flower_app/components/custom_buttom.dart';
import 'package:flower_app/components/custom_image.dart';
import 'package:flower_app/components/custom_text_field.dart';
import 'package:flower_app/components/snakbar.dart';
import 'package:flower_app/costants.dart';
import 'package:flower_app/views/home_view.dart';
import 'package:flower_app/views/register_view.dart';
import 'package:flower_app/views/reset_password_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

bool ishidden = true;
GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImage(image: 'assets/loginflower.jpg'),
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
                          'Login',
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
                          ishidden ? Icons.visibility : Icons.visibility_off,
                          color: kprimaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => (ResetPassword()),
                              ),
                            );
                       
                          },
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(color: kprimaryColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      nameButtom: 'Login',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                         await   signInToAccount(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          //  snackBar(context, 'Login successful');
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => HomeView(),
                            //   ),
                            // );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              snackBar(
                                context,
                                'No user found for that email.',
                              );
                            } else if (e.code == 'wrong-password') {
                              snackBar(
                                context,
                                'Wrong password provided for that user.',
                              );
                            } else {
                              snackBar(context, 'Wrong email or password');
                            }
                          }
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account ?',
                          style: TextStyle(color: kprimaryColor),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterView(),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
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
