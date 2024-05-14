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
    apiKey: 'AIzaSyD8656RrN64-x-BLfaRBIFfVj-O89SCj2w',
    appId: '1:290514179904:web:39ca030e3474c73aa80ca5',
    messagingSenderId: '290514179904',
    projectId: 'to-do-list-project-4ac2a',
    authDomain: 'to-do-list-project-4ac2a.firebaseapp.com',
    storageBucket: 'to-do-list-project-4ac2a.appspot.com',
    measurementId: 'G-10LYNQ3TLW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnLbukCD_a6ILMDohDGGHocFrzixIB8Z8',
    appId: '1:290514179904:android:00eb52a07e36217fa80ca5',
    messagingSenderId: '290514179904',
    projectId: 'to-do-list-project-4ac2a',
    storageBucket: 'to-do-list-project-4ac2a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCc7cU1Or9fSwLuH95Kbc1H-BSdVW2B4b8',
    appId: '1:290514179904:ios:40e210bd5c0b057da80ca5',
    messagingSenderId: '290514179904',
    projectId: 'to-do-list-project-4ac2a',
    storageBucket: 'to-do-list-project-4ac2a.appspot.com',
    iosBundleId: 'com.example.todoList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCc7cU1Or9fSwLuH95Kbc1H-BSdVW2B4b8',
    appId: '1:290514179904:ios:799c8cb39d9f705da80ca5',
    messagingSenderId: '290514179904',
    projectId: 'to-do-list-project-4ac2a',
    storageBucket: 'to-do-list-project-4ac2a.appspot.com',
    iosBundleId: 'com.example.todoList.RunnerTests',
  );
}
