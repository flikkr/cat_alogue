import 'package:cat_alogue/models/user.dart';
import 'package:cat_alogue/services/auth/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var userStreamProvider = StreamProvider<User?>((_) => user);
