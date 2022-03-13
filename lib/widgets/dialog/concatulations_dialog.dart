import 'package:cat_alogue/gen/assets.gen.dart';
import 'package:cat_alogue/widgets/dialog/dialog_template.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stilo/stilo.dart';

class ConcatulationsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DialogTemplate(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Woohoo!',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        Text(
          'Congrats on adding a cat!',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 300,
          child: Lottie.asset(Assets.lottie.catCelebrate),
        ),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Dismiss'),
          ),
        ),
      ],
    );
  }
}
