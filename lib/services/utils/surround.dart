import 'package:cat_alogue/widgets/dialog/concatulations_dialog.dart';
import 'package:cat_alogue/widgets/dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

mixin Surround {
  void showConcatulationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConcatulationsDialog(),
    );
  }

  void showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmDialog(),
    );
  }
}
