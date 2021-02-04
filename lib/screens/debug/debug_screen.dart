import 'package:cat_alogue/utils/surround.dart';
import 'package:cat_alogue/widgets/concatulations_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DebugScreen extends StatelessWidget {
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
    Surround.of(context).showDialogBox(ConcatulationsDialog());
  }
}
