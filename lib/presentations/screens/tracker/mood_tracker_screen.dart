


import 'package:flutter/material.dart';

class MoodTrackerScreen extends StatelessWidget {
  const MoodTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
      ),
      body: Center(
        child: Text(
          'Mood Tracker Screen',
        ),
      ),
    );
  }
}