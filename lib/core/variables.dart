import 'package:flutter/foundation.dart';
import 'package:eden/firebase_options.dart' as live;

class Variables {
  static String? get clientId {
        return defaultTargetPlatform == TargetPlatform.iOS
            ? live.DefaultFirebaseOptions.currentPlatform.iosClientId
            : live.DefaultFirebaseOptions.currentPlatform.androidClientId;
  }

  static String? get serverClientId {
        return defaultTargetPlatform == TargetPlatform.iOS
            ? "1:950268248783:ios:7fd89d7c605b040ff2edba"
            : "1:950268248783:android:ea31727ec3452f9af2edba";
  }

  static String get githubClientId {
    return '5f59e3d67ce13fa51bd3';
  }

  static String get githubClientSecret {
    return '6c2d23d722cc9e1374168b973e15a19349fe5aa4';
  }

  static String get githubRedirectUrl {
    return 'https://eden-6d8cb.firebaseapp.com/__/auth/handler';
  }
}