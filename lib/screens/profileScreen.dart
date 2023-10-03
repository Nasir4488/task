import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Retrieve user data when the screen is initialized
  @override
  void initState() {
    super.initState();
    final User? user = auth.currentUser;

    if (user != null) {
      nameController.text = user.displayName ?? '';
      emailController.text = user.email ?? '';
    }
  }

  // Function to update user profile
  void updateUserProfile() async {
    try {
      final User? user = auth.currentUser;

      if (user != null) {
        await user.updateProfile(displayName: nameController.text);
        await user.updateEmail(emailController.text);

        // Refresh the user's data
        await user.reload();
        final currentUser = auth.currentUser;
        if (currentUser != null) {
          setState(() {
            nameController.text = currentUser.displayName ?? '';
            emailController.text = currentUser.email ?? '';
          });
        }

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile updated successfully.'),
          ),
        );
      }
    } catch (error) {
      // Handle errors here
      print('Error updating profile: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update profile. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Name:'),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Enter your name',
            ),
          ),
          SizedBox(height: 16),
          Text('Email:'),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Enter your email',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: updateUserProfile,
            child: Text('Update Profile'),
          ),
        ],
      ),
    );
  }
}
