import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_app/components/custom_buttom.dart';
import 'package:flower_app/components/delete_account.dart';
import 'package:flower_app/costants.dart';
import 'package:flower_app/cubits/addToCard/add_to_card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final dataa = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: context.read<AddToCardCubit>().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('No user data found'));
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text('Name', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  data['name'] ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Divider(color: kprimaryColor, endIndent: 40),
                const SizedBox(height: 8),

                Text('Email', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  data['email'] ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Divider(color: kprimaryColor, endIndent: 40),
                const SizedBox(height: 8),
                Text('Created at'),
                const SizedBox(height: 4),
                Text(
                  DateFormat('d MMM, y').format(dataa!.metadata.creationTime!),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Divider(color: kprimaryColor, endIndent: 40),
                const SizedBox(height: 8),
                Text('Last login'),
                const SizedBox(height: 4),
                Text(
                  DateFormat(
                    'd MMM, y',
                  ).format(dataa!.metadata.lastSignInTime!),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                const SizedBox(height: 40),
                CustomButton(
                  nameButtom: 'Delete Account',
                  onPressed: () {
                    showDeleteDialog(context);
                  },
                  backgroundColor: Colors.red,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
