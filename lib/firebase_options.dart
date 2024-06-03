// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyB_Z9CHtsCQZBcmEz--PQaCP-66xAxJmO8',
    appId: '1:226891754811:web:63fcfb4c6456439a435b1e',
    messagingSenderId: '226891754811',
    projectId: 'deneme1453-3c33e',
    authDomain: 'deneme1453-3c33e.firebaseapp.com',
    storageBucket: 'deneme1453-3c33e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLYlyBPMuHKv1yj23I2n61p8iIQ6cgkig',
    appId: '1:226891754811:android:64915de741da3986435b1e',
    messagingSenderId: '226891754811',
    projectId: 'deneme1453-3c33e',
    storageBucket: 'deneme1453-3c33e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbQ74nGfMEkMWFUpF53BrCJXNmdT-94Zw',
    appId: '1:226891754811:ios:668769a7bd963bfb435b1e',
    messagingSenderId: '226891754811',
    projectId: 'deneme1453-3c33e',
    storageBucket: 'deneme1453-3c33e.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAbQ74nGfMEkMWFUpF53BrCJXNmdT-94Zw',
    appId: '1:226891754811:ios:668769a7bd963bfb435b1e',
    messagingSenderId: '226891754811',
    projectId: 'deneme1453-3c33e',
    storageBucket: 'deneme1453-3c33e.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB_Z9CHtsCQZBcmEz--PQaCP-66xAxJmO8',
    appId: '1:226891754811:web:56a3f2a478ed084a435b1e',
    messagingSenderId: '226891754811',
    projectId: 'deneme1453-3c33e',
    authDomain: 'deneme1453-3c33e.firebaseapp.com',
    storageBucket: 'deneme1453-3c33e.appspot.com',
  );
}
