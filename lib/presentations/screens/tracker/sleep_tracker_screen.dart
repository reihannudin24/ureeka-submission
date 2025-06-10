
import 'package:flutter/material.dart';

class SleepTrackerScreen extends StatelessWidget {
  const SleepTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Tracker'),
      ),
      body: Center(
        child: Text(
          'Sleep Tracker Screen',
        ),
      ),
    );
  }
}
