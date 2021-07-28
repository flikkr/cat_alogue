import 'package:cat_alogue/services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:lottie/lottie.dart';
import 'package:stilo/stilo.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: StiloEdge.all2,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Welcome to',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '😺-alogue',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Lottie.network(
                    'https://assets4.lottiefiles.com/packages/lf20_dopee6e0.json'),
                Text(
                  'The only cat-tracking app',
                  style: Theme.of(context).textTheme.headline6,
                ),
                StiloSpacing.vert2,
                const Divider(),
                StiloSpacing.vert2,
                const Text('Sign in with social'),
                StiloSpacing.vert2,
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
