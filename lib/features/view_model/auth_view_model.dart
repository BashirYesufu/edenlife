import 'package:eden/core/services/auth/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class AuthViewModel {
  final _repo = AuthRepositoryImpl();

  final _progressSubject = BehaviorSubject<bool>();
  Stream<bool> get progressObservable => _progressSubject.stream;

  final _errorMessageSubject = BehaviorSubject<String>();
  Stream<String> get errorMessageObservable => _errorMessageSubject.stream;

  final _loginSubject = PublishSubject<UserCredential>();
  Stream<UserCredential> get loginObservable => _loginSubject.stream;
  
  void loginWithGoogle() async {
    try {
      _progressSubject.sink.add(true);
      await _repo.loginWithGoogle().then((credentials) {
        _loginSubject.sink.add(credentials);
        _progressSubject.sink.add(false);
      }, onError: (e) {
        _loginSubject.sink.addError(e);
        _progressSubject.sink.add(false);
      });
    }  on Exception catch(e){
      _loginSubject.sink.addError(e);
    }
    catch (e) {
      _loginSubject.sink.addError(e);
    }
  }

  void loginWithGithub(BuildContext context) async {
    try {
      _progressSubject.sink.add(true);
      await _repo.loginWithGithub(context).then((credentials) {
        _loginSubject.sink.add(credentials);
        _progressSubject.sink.add(false);
      }, onError: (e) {
        _loginSubject.sink.addError(e);
        _progressSubject.sink.add(false);
      });
    }  on Exception catch(e){
      _loginSubject.sink.addError(e);
    }
    catch (e) {
      _loginSubject.sink.addError(e);
    }
  }
  
}