import 'package:flutter/material.dart';
import 'package:taskio/app/locator.dart';
// import 'package:taskio/app/router/routes.gr.dart';
import 'package:taskio/core/models/user.dart';
import 'package:taskio/core/services/auth.dart';

class LoginViewModel extends ChangeNotifier {
  final _auth = locator<AuthServiceImpl>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _login = GlobalKey<FormState>();

  get login => _login;

  bool _visible = true;

  bool get visible => _visible;

  void setVisible() {
    _visible = !_visible;
    notifyListeners();
  }

  void formValidation(BuildContext context) async {
    if (_login.currentState.validate()) {
      await _auth.loginWithEmailAndPassword(
        context,
        User(
          email: email.text,
          password: password.text,
        ),
      );
      //await Navigator.pushReplacementNamed(context, Routes.homeView);
    }
  }

  void navigateToRegisterView(BuildContext context) {
    email.clear();
    password.clear();
    notifyListeners();
    Navigator.pop(context);
  }
}
