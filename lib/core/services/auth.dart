import 'package:flutter/material.dart';

abstract class AuthService {
  Future registerWithEmailAndPassword();
  Future loginWithEmailAndPassword();
  Future logOut();
}

class AuthServiceImpl implements AuthService{
  @override
  Future logOut() {
 
  }

  @override
  Future loginWithEmailAndPassword() {
 
  }

  @override
  Future registerWithEmailAndPassword() {
  
  }
  
}
