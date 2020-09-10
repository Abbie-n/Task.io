import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskio/app/locator.dart';
import 'package:taskio/app/router/routes.gr.dart';
// import 'package:taskio/core/services/auth.dart';

class HomeViewModel extends ChangeNotifier {
  final fireStore = locator<Firestore>();
  getDate() {
    DateTime date = DateTime.now();
    final formattedDate = DateFormat('MMM d, y').format(date);
    return formattedDate;
  }

  void navigateCreateTaskView(BuildContext context) {
    Navigator.pushNamed(context, Routes.createTaskView);
  }
}
