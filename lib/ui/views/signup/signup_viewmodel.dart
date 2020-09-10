import 'package:flutter/material.dart';
import 'package:taskio/app/locator.dart';
import 'package:taskio/app/router/routes.gr.dart';
import 'package:taskio/core/models/user.dart';
import 'package:taskio/core/services/auth.dart';

class SignupViewModel extends ChangeNotifier {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  FormFieldState<String> state;

  final _signup = GlobalKey<FormState>();

  final _auth = locator<AuthServiceImpl>();

  get signup => _signup;

  bool _visible = true;
  bool _secondVisible = true;

  bool get visible => _visible;
  bool get secondVisible => _secondVisible;

  void setVisible() {
    _visible = !_visible;
    notifyListeners();
  }

  void setSecondVisible() {
    _secondVisible = !_secondVisible;
    notifyListeners();
  }

  bool emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  void formValidation(BuildContext context) async {
    if (_signup.currentState.validate()) {
      await _auth.registerWithEmailAndPassword(
        context,
        User(
          fullName: fullname.text.trim(),
          email: email.text.trim(),
          password: password.text,
          role: _selected,
        ),
      );
      print(fullname.text);
      //await Navigator.pushReplacementNamed(context, Routes.homeView);
      print('Verified');
    }
  }

  void navigateToLoginView(BuildContext context) {
    fullname.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
    _selected = userLevels[4];
    notifyListeners();
    Navigator.pushNamed(context, Routes.loginView);
  }

  List<String> userLevels = [
    'Super Admin',
    'Admin',
    'Manager',
    'Creator',
    'Collaborator'
  ];

  String _selected;
  String get selected => _selected ?? userLevels[4];

  set selectedLevel(String val) {
    _selected = val;
    notifyListeners();
  }

  void stateDidChange(String value) {
    state.didChange(value);
    notifyListeners();
  }
}
