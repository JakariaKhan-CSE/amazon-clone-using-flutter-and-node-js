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
      token: '');

  User get user=> _user; // _user private tai function diye get korte hobe
void setUser(String user)  // backend theke back kora data string hoi aita ke decode kore json korte hoi
{
  _user = User.fromJson(user);
  notifyListeners(); // aita na dile state update hobe na
}
}
