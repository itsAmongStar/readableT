import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBniKYdZ6VGuMsVYGsWyC0IPDrsLyLxXXg",
            authDomain: "readabletapi.firebaseapp.com",
            projectId: "readabletapi",
            storageBucket: "readabletapi.appspot.com",
            messagingSenderId: "409764729856",
            appId: "1:409764729856:web:03ba2bc765bae0b879f4e5",
            measurementId: "G-CJYB8850CR"));
  } else {
    await Firebase.initializeApp();
  }
}
