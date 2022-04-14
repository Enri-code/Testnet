// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:testnet/domain/auth.dart';
import 'package:testnet/models/user.dart';

enum AuthState {
  LoggedOut,
//
  Registering,
  Registered,
  NotRegistered,
  //
  Authenticating,
  LoggedIn,
  NotLoggedIn,
}

class AuthProvider with ChangeNotifier {
  final _auth = FakeAuth();
  AuthState _loggedInState = AuthState.NotLoggedIn;
  AuthState _registeredState = AuthState.NotRegistered;

  AuthState get loggedInState => _loggedInState;
  AuthState get registeredState => _registeredState;

  set loggedInState(val) {
    _loggedInState = val;
    notifyListeners();
  }

  set registeredState(val) {
    _registeredState = val;
    notifyListeners();
  }

  Future<User> login(String email, String password) async {
    loggedInState = AuthState.Authenticating;
    try {
      var userMap = await _auth.login(email, password);
      loggedInState = AuthState.LoggedIn;
      return User.fromMap(userMap['user']);
    } catch (e) {
      print(e);
      loggedInState = AuthState.NotLoggedIn;
      rethrow;
    }
  }

  Future<User> register(String email, String password) async {
    registeredState = AuthState.Authenticating;
    try {
      var userMap = await _auth.register(email, password);
      registeredState = AuthState.Registered;
      return User.fromMap(userMap);
    } catch (e) {
      print(e);
      registeredState = AuthState.NotRegistered;
      rethrow;
    }
  }
}
