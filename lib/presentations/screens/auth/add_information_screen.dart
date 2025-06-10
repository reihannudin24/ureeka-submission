
import 'package:flutter/material.dart';

class AddInformationScreen extends StatelessWidget {
  const AddInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Information'),
      ),
      body: Center(
        child: Text('This is the Add Information Screen'),
      ),
    );
  }
}