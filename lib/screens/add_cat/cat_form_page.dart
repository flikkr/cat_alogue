import 'package:cat_alogue/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stilo/stilo.dart';

class CatFormPage extends StatelessWidget {
  final Cat? cat;
  final _formKey = GlobalKey<FormState>();

  CatFormPage({
    Key? key,
    this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cat == null ? 'Create cat' : 'Edit cat')),
      body: Column(
        children: [
          FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormBuilderTextField(
                  name: 'email',
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.alternate_email_rounded)),
                ),
                StiloSpacing.vert3,
                FormBuilderTextField(
                  name: 'password',
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_rounded)),
                  obscureText: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
