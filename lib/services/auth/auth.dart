import 'package:cat_alogue/models/user.dart';
import 'package:cat_alogue/services/data/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:google_sign_in/google_sign_in.dart';

final fb_auth.FirebaseAuth _auth = fb_auth.FirebaseAuth.instance;

// auth change user stream
Stream<User?> get user {
  return _auth
      .authStateChanges()
      .map((fb_auth.User? user) => user != null ? User(user.uid) : null);
}

// Sign in with Google
Future<fb_auth.User?> signInWithGoogle() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  fb_auth.User? user;

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final fb_auth.AuthCredential credential =
        fb_auth.GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      final userCredential = await _auth.signInWithCredential(credential);

      user = userCredential.user;
      if (user != null) {
        DatabaseService(user.uid);
      }
    } on fb_auth.FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        // handle the error here
      } else if (e.code == 'invalid-credential') {
        // handle the error here
      }
    } catch (e) {
      // handle the error here
    }
  }

  return user;
}

// sign out
Future<void> signOut() async {
  try {
    return await _auth.signOut();
  } catch (e) {
    print(e.toString());
  }
}
