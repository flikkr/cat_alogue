import 'package:cat_alogue/screens/cat_list/form/cat_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var catFormProvider = ChangeNotifierProvider((_) => CatFormProvider());

class CatForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Cat name '),
          ),
        ],
      ),
    );
  }
}
