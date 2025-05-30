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
    apiKey: 'AIzaSyDbsrHPVV2kjC5Fn9SHGezHrcjyjHUxINE',
    appId: '1:836450241905:web:06d0c8728c0816b0e4bad0',
    messagingSenderId: '836450241905',
    projectId: 'professors-english-academy',
    authDomain: 'professors-english-academy.firebaseapp.com',
    storageBucket: 'professors-english-academy.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAG7yBuSHAAPnDgCRirB7QXjvFxAYLkOEg',
    appId: '1:836450241905:android:7fb63825613fc631e4bad0',
    messagingSenderId: '836450241905',
    projectId: 'professors-english-academy',
    storageBucket: 'professors-english-academy.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdZW_KN1JgRA_7kd_38OIB0UyOmtdvgGA',
    appId: '1:836450241905:ios:d8ce98478fd10ebce4bad0',
    messagingSenderId: '836450241905',
    projectId: 'professors-english-academy',
    storageBucket: 'professors-english-academy.firebasestorage.app',
    androidClientId: '836450241905-5mhc91sostbmlt5rqu8pn0eti0gmug36.apps.googleusercontent.com',
    iosClientId: '836450241905-fmftjpimaeo3uidqhblerm0jvmno88hn.apps.googleusercontent.com',
    iosBundleId: 'com.example.professorsEnglishAcademy',
  );
}
