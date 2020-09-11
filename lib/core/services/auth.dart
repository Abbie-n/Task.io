import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskio/app/locator.dart';
import 'package:taskio/app/router/routes.gr.dart';
import 'package:taskio/core/models/user.dart';
import 'package:taskio/ui/views/home/home_view.dart';

abstract class AuthService {
  Future registerWithEmailAndPassword(BuildContext context, User user);
  Future loginWithEmailAndPassword(BuildContext context, User user);
  Future logOut(User user);
}

class AuthServiceImpl implements AuthService {
  final _auth = locator<FirebaseAuth>();
  final _firestore = locator<Firestore>();

  //final FirebaseAuth _auth = FirebaseAuth.instance;

// a custom user model
  User _firebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, email: user.email) : null;
  }

// stream to listen to user authentication changes. (signed in or logged out)
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(
      (user) => _firebaseUser(user),
    );
  }

  @override
  // user firebase registration
  Future registerWithEmailAndPassword(BuildContext context, User user) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      await _firestore.collection('users').document(result.user.uid).setData({
        'UID': result.user.uid,
        'Email': user.email,
        'Full Name': user.fullName,
        'Role': user.role,
      });
      result.user.sendEmailVerification();

      Navigator.pushReplacementNamed(context, Routes.loginView);
      print(result);
      print(user.uid);
    } catch (e) {
      switch (e.code) {
        case "ERROR_WEAK_PASSWORD":
          user.firebaseError = "Password should be more than 6 characters!";
          break;
        case "ERROR_INVALID_EMAIL":
          user.firebaseError = "Email is not valid!";
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          user.firebaseError = 'User Already Exists!';
      }
      print(e.toString());
    }
  }

  @override
  // user firebase log in with email and password
  Future loginWithEmailAndPassword(BuildContext context, User user) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (result.user.isEmailVerified) {
        Navigator.pushReplacementNamed(
          context,
          Routes.homeView,
          arguments: HomeViewArguments(userId: result.user.uid),
        );
      } else {
        print('Not verified my Nigga!');
      }
      print(result);
    } catch (e) {
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
          user.firebaseError = "Incorrect Email Address!";
          break;
        case "ERROR_WRONG_PASSWORD":
          user.firebaseError = "Incorrect Password!";
          break;
        case "ERROR_USER_NOT_FOUND":
          user.firebaseError = "User not found!";
          break;
        case "ERROR_USER_DISABLED":
          user.firebaseError = "User with this email has been disabled!";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          user.firebaseError = "Too many requests. Try again later!";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          user.firebaseError =
              "Signing in with Email and Password is not enabled!";
          break;
        default:
          user.firebaseError = "Kindly try again after few minutes!";
      }
      print(e.toString());
    }
  }

  @override
  // user log out
  Future logOut(User user) async {
    try {
      await _auth.signOut();
    } catch (e) {
      user.firebaseError = e;
    }
  }
}
