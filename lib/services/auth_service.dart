import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/model/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/global_variable.dart';
class AuthService {
  // signUp user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  }) async {
    try{
      User user = User(id: '', name: name, password: password, address: '', type: '', token: '', email: email);

      http.Response res = await http.post(Uri.parse('$url/api/signup'), body: user.toJson(), // body ta jsonEncode kora hosse toJson() call kore
      headers: <String,String>{
        'Content-type': 'application/json; charset=UTF-8',
      }
      );
httpErrorHandling(response: res, context: context, onSuccess: (){
  showSnackbar(context, 'Account Created! Login with same credentials', Colors.green);
});

    }catch(e)
    {
      showSnackbar(context, e.toString(), Colors.red);
    }
  }
}
