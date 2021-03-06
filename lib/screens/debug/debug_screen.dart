import 'package:cat_alogue/services/utils/surround.dart';
import 'package:flutter/material.dart';

class DebugScreen extends StatelessWidget with Surround {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debug screen'),
      ),
      body: ElevatedButton(
        onPressed: () => _toggleDialog(context),
        child: Text('Press me!'),
      ),
    );
  }

  void _toggleDialog(BuildContext context) {
    showConcatulationsDialog(context);
  }
}
