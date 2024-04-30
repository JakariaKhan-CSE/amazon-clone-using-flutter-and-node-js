import 'dart:convert';

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

  // signIn user
  void signInUser({  // aivabe likhle constructor lage na. So class er onject create a kono jhamela nei. alada function er parameter constructor er moto use kra hosse
    required BuildContext context,
    required String email,

    required String password,
  }) async {
    try{

      http.Response res = await http.post(Uri.parse('$url/api/signin'), body: jsonEncode({  // backend a send korte gele middlewar er jonno jsonEncode korte hoi
        "email":email,
        "password": password   // "email", "password" same as req.body in backend otherwise get error
      }), // body ta jsonEncode kora hosse toJson() call kore
          headers: <String,String>{
            'Content-type': 'application/json; charset=UTF-8',
          }
      );
      // print(res.body);
      httpErrorHandling(response: res, context: context, onSuccess: (){
        showSnackbar(context, ' Login Successfull', Colors.green);
      });

    }catch(e)
    {
      showSnackbar(context, e.toString(), Colors.red);
    }
  }

}
