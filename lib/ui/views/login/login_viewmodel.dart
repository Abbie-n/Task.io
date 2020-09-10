import 'package:flutter/material.dart';
import 'package:taskio/app/router/routes.gr.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _login = GlobalKey<FormState>();

  get login => _login;

  bool _visible = false;

  bool get visible => _visible;

  void setVisible() {
    _visible = !_visible;
    notifyListeners();
  }

  void formValidation(BuildContext context) {
    if (_login.currentState.validate()) {
      Navigator.pushNamed(context, Routes.homeView);
    }
  }

  void navigateToRegisterView(BuildContext context) {
    Navigator.pop(context);
  }
}
