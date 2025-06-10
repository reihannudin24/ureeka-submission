


import 'package:flutter/material.dart';

class StressTrackerScreen extends StatelessWidget {
  const StressTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stress Tracker'),
      ),
      body: Center(
        child: Text(
          'Stress Tracker Screen',
        ),
      ),
    );
  }
}