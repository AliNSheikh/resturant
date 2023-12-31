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
    apiKey: 'AIzaSyAUeU1bxA5W93MLh1-Ap_pPGfxPFsZO8fc',
    appId: '1:753241504098:web:46bdfaff47a79dd57b543b',
    messagingSenderId: '753241504098',
    projectId: 'task-526f9',
    authDomain: 'task-526f9.firebaseapp.com',
    storageBucket: 'task-526f9.appspot.com',
    measurementId: 'G-EP2E1FJERM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-s_KPWFY34OGFwog7xaSJ2imZRVaFDlw',
    appId: '1:753241504098:android:3fdfb05b0345b9007b543b',
    messagingSenderId: '753241504098',
    projectId: 'task-526f9',
    storageBucket: 'task-526f9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgi5CX7Zr_9HUPWHQLF7lJBxfWyGAJJWA',
    appId: '1:753241504098:ios:1c38969d35a3110f7b543b',
    messagingSenderId: '753241504098',
    projectId: 'task-526f9',
    storageBucket: 'task-526f9.appspot.com',
    iosBundleId: 'com.example.task',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDgi5CX7Zr_9HUPWHQLF7lJBxfWyGAJJWA',
    appId: '1:753241504098:ios:fc2a99b33e41ff8f7b543b',
    messagingSenderId: '753241504098',
    projectId: 'task-526f9',
    storageBucket: 'task-526f9.appspot.com',
    iosBundleId: 'com.example.task.RunnerTests',
  );
}
