import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  // final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Text(
          'Profile Screen',
        ),
      ),
    );
  }
}