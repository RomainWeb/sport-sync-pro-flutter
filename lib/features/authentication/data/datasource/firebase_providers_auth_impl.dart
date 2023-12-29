import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sport_sync_pro/application/exceptions/auth_exceptions_handler.dart';

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
      var authStatus = await signInWithGoogleAccount(auth, googleAccount, context);
      if (authStatus == AuthStatus.successful) {
        return auth.currentUser;
      } else {
        var showSnackBar = ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(content: AuthExceptionHandler.generateErrorMessage(authStatus)));
      }
    }
    return null;
  }

  static Future<AuthStatus> signInWithGoogleAccount(FirebaseAuth auth,
      GoogleSignInAccount googleAccount, BuildContext context) async {
    try {
      final GoogleSignInAuthentication googleAuth = await googleAccount
          .authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential);

      AutoRouter.of(context).pushNamed('/');
      return AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      return AuthExceptionHandler.handleAuthException(e);
    } catch (e) {
      return AuthStatus.unknown;
    }
  }
}
