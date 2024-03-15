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
    apiKey: 'AIzaSyDyYKa3bX_dK1o6OwyhXG8AJpygQFAXswE',
    appId: '1:291340568369:web:21846041914bd47977d210',
    messagingSenderId: '291340568369',
    projectId: 'alqatareyacontracts',
    authDomain: 'alqatareyacontracts.firebaseapp.com',
    storageBucket: 'alqatareyacontracts.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxSUMmhxIBXW3WuzcvQ9RbLhTaq7mztoc',
    appId: '1:291340568369:android:7eedc2f06ac0da0177d210',
    messagingSenderId: '291340568369',
    projectId: 'alqatareyacontracts',
    storageBucket: 'alqatareyacontracts.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAm36o1C64FidLHIBxS-9yy5kCn4ONQ4lM',
    appId: '1:291340568369:ios:5dff5cc5381415f977d210',
    messagingSenderId: '291340568369',
    projectId: 'alqatareyacontracts',
    storageBucket: 'alqatareyacontracts.appspot.com',
    iosBundleId: 'com.example.alqatareyacontracts',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAm36o1C64FidLHIBxS-9yy5kCn4ONQ4lM',
    appId: '1:291340568369:ios:1206a1173a1f193477d210',
    messagingSenderId: '291340568369',
    projectId: 'alqatareyacontracts',
    storageBucket: 'alqatareyacontracts.appspot.com',
    iosBundleId: 'com.example.alqatareyacontracts.RunnerTests',
  );
}
