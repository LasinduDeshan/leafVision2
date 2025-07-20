import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: user == null
            ? Text('No user logged in')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Email: ${user.email ?? "-"}'),
                  SizedBox(height: 8),
                  Text('UID: ${user.uid}'),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Back'),
                  ),
                ],
              ),
      ),
    );
  }
} 