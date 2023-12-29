import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FirebaseProvidersAuthImpl {
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    if (kIsWeb) {
      return webSignIn(auth);
    } else {
      return nonWebSignIn(auth, context);
    }
  }

  static Future<User?> webSignIn(FirebaseAuth auth) async {
    User? user;
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();
      final UserCredential userCredential = await auth.signInWithPopup(
          googleProvider);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }
    return user;
  }

  static Future<User?> nonWebSignIn(FirebaseAuth auth,
      BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

    if (googleAccount != null) {
      final userCredential = await signInWithGoogleAccount(
          auth, googleAccount, context);
      return userCredential?.user;
    }
    return null;
  }

  static Future<UserCredential?> signInWithGoogleAccount(FirebaseAuth auth,
      GoogleSignInAccount googleAccount, BuildContext context) async {
    try {
      final GoogleSignInAuthentication googleAuth = await googleAccount
          .authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await auth.signInWithCredential(
          credential);

      AutoRouter.of(context).pushNamed('/');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e, context);
      return null;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        FirebaseProvidersAuthImpl.customSnackBar(
          content: 'Error occurred using Google Sign In. Try again.',
        ),
      );
      return null;
    }
  }

  static void handleFirebaseAuthException(FirebaseAuthException e,
      BuildContext context) {
    String content = '';
    if (e.code == 'account-exists-with-different-credential') {
      content = 'The account already exists with a different credential';
    } else if (e.code == 'invalid-credential') {
      content = 'Error occurred while accessing credentials. Try again.';
    }
    ScaffoldMessenger.of(context).showSnackBar(
      FirebaseProvidersAuthImpl.customSnackBar(
        content: content,
      ),
    );
  }
}
