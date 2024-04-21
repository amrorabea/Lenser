import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:source_code/components/containers.dart';
import 'package:source_code/pages/home.dart';

class Auth {
  createUserWithEmailAndPassword(String email, password, context) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("The password provided is too weak.")));
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("The account already exists for that email.")));
        // print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  loginFirebase(email, password, context) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No user found for that email")));
        print("No user found for that email");
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Wrong password provided for that user")));
        print("Wrong password provided for that user");
      }
    }
  }

  guest(context) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInAnonymously().then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
      });
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
}
