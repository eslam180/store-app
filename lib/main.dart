import 'package:flower_app/costants.dart';
import 'package:flower_app/cubits/addToCard/add_to_card_cubit.dart';
import 'package:flower_app/views/home_view.dart';
import 'package:flower_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const StoreApp());
}


class AuthCheckLogin extends StatelessWidget {
  const AuthCheckLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          // اليوزر مسجل دخول قبل كده
          return HomeView();
        } else {
          // اليوزر مش مسجل دخول قبل كده ع الجهاز ده
          return LoginView();
        }
      },
    );
  }
}



class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCardCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          fontFamily: 'RobotoCondensed',
          useMaterial3: false,
          colorScheme: ColorScheme.fromSeed(seedColor: kprimaryColor),
        ),

        home: AuthCheckLogin(),
      ),
    );
  }
}
