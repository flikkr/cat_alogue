import 'package:cat_alogue/models/cat.dart';
import 'package:flutter/material.dart';

class CatForm extends StatelessWidget {
  final Cat? cat;
  final _formKey = GlobalKey<FormState>();

  CatForm({this.cat});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Cat name '),
            initialValue: cat?.name,
          ),
        ],
      ),
    );
  }
}
