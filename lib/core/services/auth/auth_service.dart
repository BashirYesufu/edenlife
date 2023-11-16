import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_sign_in_plus/github_sign_in_plus.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../variables.dart';

class AuthService {

  Future<UserCredential> loginWithGoogle() async {
    var completer = Completer<UserCredential>();
    try {

      final GoogleSignInAccount? gUser = await GoogleSignIn(
        clientId: Variables.clientId,
        serverClientId: Variables.serverClientId,
      ).signIn();

      final GoogleSignInAuthentication? googleAuth =
          await gUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      var cred = await FirebaseAuth.instance.signInWithCredential(credential);
      completer.complete(cred);
    } catch (e) {
      completer.completeError(e.toString());
    }
    return completer.future;
  }

  Future<UserCredential> loginWithGithub(BuildContext context) async {
    var completer = Completer<UserCredential>();
    try {
      final GitHubSignIn gitHubSignIn = GitHubSignIn(
          clientId: Variables.githubClientId,
          clientSecret: Variables.githubClientSecret,
          redirectUrl: Variables.githubRedirectUrl);

      final GitHubSignInResult result = await gitHubSignIn.signIn(context);
      if (result.status != GitHubSignInResultStatus.ok) {
        completer.completeError('Error getting github credentials');
      }
      final credential = GithubAuthProvider.credential(result.token!);

      // Once signed in, return the UserCredential
      var cred = await FirebaseAuth.instance.signInWithCredential(credential);
      completer.complete(cred);
    } catch (e) {
      completer.completeError(e.toString());
    }
    return completer.future;
  }


}