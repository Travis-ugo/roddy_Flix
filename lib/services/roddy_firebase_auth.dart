import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RoddyAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn();
  final FacebookAuth _faceBookAuth = FacebookAuth.instance;

  Stream<User?> currentUser() {
    return _firebaseAuth.authStateChanges();
  }

  Future createAccountWithEmailAndPassword(userEmail, userPassword) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      await _firebaseAuth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (error) {
      debugPrint('Firebase error catch during process : $error');
    }
  }

  Future logInWithEmailAndPassword(userEmail, userPassword) async {
    try {
      var methods = await _firebaseAuth.fetchSignInMethodsForEmail(userEmail);
      if (!methods.contains('password')) {
        // displayDialogueBox();
      }
      await _firebaseAuth.signInWithEmailAndPassword(
        email: userEmail.toLowerCase().trim(),
        password: userPassword,
      );
    } on FirebaseAuthException catch (error) {
      debugPrint('Firebase error include $error');
    }
  }

  Future logInWithGoogleCredential() async {
    try {
      // Trigger the authentication flow
      var googleUser = await _googleAuth.signIn();

      // Obtain the auth details from the request
      final googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      debugPrint('Firebase error include $error');
    }
  }

  Future logInWithFacebookCredentials() async {
    try {
      // Trigger the sign-in flow
      final loginResult = await _faceBookAuth.login();

      // Create a credential from the access token
      final facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (error) {
      debugPrint('Firebase error include $error');
    }
  }

  Future signOutRoddy() async {
    try {
      _firebaseAuth.signOut();
    } on FirebaseAuthException catch (error) {
      debugPrint('Firebase error include $error');
    }
  }
}
