import 'package:cat_alogue/screens/cat_list/form/cat_form.dart';
import 'package:cat_alogue/widgets/concatulations_dialog.dart';
import 'package:cat_alogue/widgets/misc/drag_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin Surround {
  showCatForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                DragIndicator(),
                CatForm(),
              ],
            ),
          ),
        );
      },
    );
  }

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
