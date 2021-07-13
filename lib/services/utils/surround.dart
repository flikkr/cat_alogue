import 'package:cat_alogue/widgets/concatulations_dialog.dart';
import 'package:cat_alogue/widgets/misc/drag_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin Surround {
  showConcatulationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(10),
        child: ConcatulationsDialog(),
      ),
    );
  }
}
