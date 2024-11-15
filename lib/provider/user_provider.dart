import 'package:amazon_clone/model/users.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      email: '',
      name: '',
      password: '',
      address: '',
      type: '',
      token: '',
    cart: []
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
