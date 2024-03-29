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
    apiKey: 'AIzaSyDmzxCjssALAK9MPQhvIiVfIDTBm98KQBk',
    appId: '1:881477916914:web:0f18cac89a5f168930586b',
    messagingSenderId: '881477916914',
    projectId: 'gihoc-mobile',
    authDomain: 'gihoc-mobile.firebaseapp.com',
    storageBucket: 'gihoc-mobile.appspot.com',
    measurementId: 'G-LLRCS4SMZ3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-JPgPoNW8clEzYSf9Rmvxo7iZc6upeps',
    appId: '1:881477916914:android:671a2d9b1e308e3330586b',
    messagingSenderId: '881477916914',
    projectId: 'gihoc-mobile',
    storageBucket: 'gihoc-mobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQQypn9qZW-Pgo_NCilKEW4KuE7gSUSk8',
    appId: '1:881477916914:ios:218f795701f9232b30586b',
    messagingSenderId: '881477916914',
    projectId: 'gihoc-mobile',
    storageBucket: 'gihoc-mobile.appspot.com',
    iosBundleId: 'com.example.coffeeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQQypn9qZW-Pgo_NCilKEW4KuE7gSUSk8',
    appId: '1:881477916914:ios:218f795701f9232b30586b',
    messagingSenderId: '881477916914',
    projectId: 'gihoc-mobile',
    storageBucket: 'gihoc-mobile.appspot.com',
    iosBundleId: 'com.example.coffeeApp',
  );
}
