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

  Future<bool?> showDeleteConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const ConfirmDialog(
        title: 'Delete cat',
        body:
            'Are you sure you want to delete this cat? This action cannot be undone.',
      ),
    );
  }
}
