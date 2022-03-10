import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class DialogTemplate extends StatelessWidget {
  final Widget child;

  const DialogTemplate({required this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: StiloEdge.all3,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
