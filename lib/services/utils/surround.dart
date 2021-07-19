import 'package:cat_alogue/widgets/concatulations_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:stilo/stilo.dart';
import 'package:flutter/material.dart';

mixin Surround {
  void showConcatulationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: StiloEdge.all3,
        child: ConcatulationsDialog(),
      ),
    );
  }
}
