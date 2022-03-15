import 'package:cat_alogue/widgets/layout/dialog_layout.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String body;

  const ConfirmDialog({
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        StiloSpacing.vert3,
        Text(
          body,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        StiloSpacing.vert3,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Back'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text('Delete'),
            ),
          ],
        )
      ],
    );
  }
}
