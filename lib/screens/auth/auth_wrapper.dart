import 'package:cat_alogue/models/user.dart';
import 'package:cat_alogue/provider/session_provider.dart';
import 'package:cat_alogue/screens/auth/sign_in_screen.dart';
import 'package:cat_alogue/screens/home/home_screen.dart';
import 'package:cat_alogue/services/data/database_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthWrapper extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStreamProvider);

    return user.when(
      data: (value) {
        if (value == null) {
          return SignInScreen();
        } else {
          _initServices(value);
          return HomePage();
        }
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text(err.toString()),
    );
  }

  void _initServices(User user) {
    DatabaseService(user.uid);
    // LocalDatabase.userID = user.uid;
  }
}
