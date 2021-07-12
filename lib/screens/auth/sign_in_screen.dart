import 'package:cat_alogue/services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:stilo/stilo.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: StiloEdge.all2,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                StiloSpacing.vert10,
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
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.email(context),
                        ]),
                      ),
                      StiloSpacing.vert3,
                      FormBuilderTextField(
                        name: 'password',
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_rounded)),
                        obscureText: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.minLength(context, 8),
                          FormBuilderValidators.maxLength(context, 16),
                        ]),
                      ),
                    ],
                  ),
                ),
                StiloSpacing.vert2,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    const TextSpan(text: 'Forgot password?'),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      print('Valid');
                    } else {
                      print('Invalid');
                    }
                    print(_formKey.currentState?.value);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Divider(),
                const Text('Sign in with social'),
                SignInButton(
                  Buttons.GoogleDark,
                  onPressed: () => signInWithGoogle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
