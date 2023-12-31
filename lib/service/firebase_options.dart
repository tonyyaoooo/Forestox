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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBs8n8r3DBEMKUvA4aMNRcKHcjWiIe9J8Q',
    appId: '1:896214772331:web:5e8171ffb0e1bcd5779f2e',
    messagingSenderId: '896214772331',
    projectId: 'forestox-ee2a6',
    authDomain: 'forestox-ee2a6.firebaseapp.com',
    storageBucket: 'forestox-ee2a6.appspot.com',
    measurementId: 'G-FK8NDXXE18',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWP_7YVg3Gj2U8QbQ-d0kkX2Li2wCFO5Y',
    appId: '1:896214772331:android:7aaa485782d698ad779f2e',
    messagingSenderId: '896214772331',
    projectId: 'forestox-ee2a6',
    storageBucket: 'forestox-ee2a6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOTAXC5FlNceV3GngbLyEx7fzFm9cD3XI',
    appId: '1:896214772331:ios:3b20839dcf040359779f2e',
    messagingSenderId: '896214772331',
    projectId: 'forestox-ee2a6',
    storageBucket: 'forestox-ee2a6.appspot.com',
    iosBundleId: 'com.itcoderz.tonyyaooo',
  );
}
