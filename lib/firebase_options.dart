// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCRGwrAKyBKkOO1WjduOpxjFwWPuBs91Rk',
    appId: '1:296810083850:web:03e0fa41d754fbfa3e51f3',
    messagingSenderId: '296810083850',
    projectId: 'now-vibes-93193',
    authDomain: 'now-vibes-93193.firebaseapp.com',
    storageBucket: 'now-vibes-93193.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDF6eWRBV0PleiuPsyftGep4htv0_I7czI',
    appId: '1:296810083850:android:2c07100975bca39d3e51f3',
    messagingSenderId: '296810083850',
    projectId: 'now-vibes-93193',
    storageBucket: 'now-vibes-93193.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwbmioA_-zmjmQXS-1ooHhWCMkDfqPNR8',
    appId: '1:296810083850:ios:da8fd2f7203d18b23e51f3',
    messagingSenderId: '296810083850',
    projectId: 'now-vibes-93193',
    storageBucket: 'now-vibes-93193.appspot.com',
    iosBundleId: 'com.example.nowVibes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwbmioA_-zmjmQXS-1ooHhWCMkDfqPNR8',
    appId: '1:296810083850:ios:3445adc6eeafe3b33e51f3',
    messagingSenderId: '296810083850',
    projectId: 'now-vibes-93193',
    storageBucket: 'now-vibes-93193.appspot.com',
    iosBundleId: 'com.example.nowVibes.RunnerTests',
  );
}