import 'package:cat_alogue/models/cat.dart';
import 'package:cat_alogue/models/user.dart';
import 'package:cat_alogue/repositories/mock_cat_data.dart';
import 'package:cat_alogue/services/auth/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var catProvider = StateProvider<List<Cat>>((_) => MockCatData().all());
var userStreamProvider = StreamProvider<User?>((_) => user);
