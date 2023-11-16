import 'package:eden/core/services/auth/auth_repository.dart';
import 'package:eden/core/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _service = AuthService();

  @override
  Future<UserCredential> loginWithGithub(BuildContext context) {
    return _service.loginWithGithub(context);
  }

  @override
  Future<UserCredential> loginWithGoogle() {
    return _service.loginWithGoogle();
  }

}