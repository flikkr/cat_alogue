import 'package:cat_alogue/services/utils/surround.dart';
import 'package:flutter/material.dart';

class DebugScreen extends StatelessWidget with Surround {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug screen'),
      ),
      body: ElevatedButton(
        onPressed: () => openDialog(context),
        child: const Text('Press me!'),
      ),
    );
  }

  void openDialog(BuildContext context) {
    // showConcatulationsDialog(context);
    showDeleteConfirmationDialog(context);
  }
}
