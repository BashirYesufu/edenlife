import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthRepository {
  Future<UserCredential> loginWithGoogle();

  Future<UserCredential> loginWithGithub(BuildContext context);
}