import 'package:cat_alogue/screens/cat_list/form/cat_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

var catFormProvider = ChangeNotifierProvider((_) => CatFormProvider());

class CatForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [],
      ),
    );
  }
}
