import 'package:flutter/material.dart';

class DragIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        width: 70,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black26,
        ),
      ),
    );
  }
}
