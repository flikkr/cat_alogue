import 'package:cat_alogue/widgets/misc/drag_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Surround {
  BuildContext context;

  Surround.of(this.context);

  showBottomSheet(Widget widget) {
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
                widget,
              ],
            ),
          ),
        );
      },
    );
  }
}
