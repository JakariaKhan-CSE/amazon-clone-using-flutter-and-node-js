import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/home/screen/home_screen.dart';
import 'package:amazon_clone/model/users.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/global_variable.dart';

class AuthService {
  // signUp user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          password: password,
          address: '',
          type: '',
          token: '',
          email: email);

      http.Response res = await http.post(Uri.parse('$url/api/signup'),
          body:
              user.toJson(), // body ta jsonEncode kora hosse toJson() call kore
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
          });
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () {
            showSnackbar(context,
                'Account Created! Login with same credentials', Colors.green);
          });
    } catch (e) {
      showSnackbar(context, e.toString(), Colors.red);
    }
  }

  // signIn user
  void signInUser({
    // aivabe likhle constructor lage na. So class er onject create a kono jhamela nei. alada function er parameter constructor er moto use kra hosse
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$url/api/signin'),
          body: jsonEncode({
            // backend a send korte gele middlewar er jonno jsonEncode korte hoi
            "email": email,
            "password":
                password // "email", "password" same as req.body in backend otherwise get error
          }), // body ta jsonEncode kora hosse toJson() call kore
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
          });
      print(res.body);
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences
                .getInstance(); // sharedperefence a token store kora hosse jate user ke bar bar login korte na hoi
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
            showSnackbar(context, ' Login Successfull',
                Colors.green); // delete this later

            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
          });
    } catch (e) {
      showSnackbar(context, e.toString(), Colors.red);
    }
  }

  // get user data
  void getUserData(

     BuildContext context,

  ) async {
    try {
      SharedPreferences prefs =await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if(token==null)
        {
          prefs.setString('x-auth-token', '');
        }
      
      var tokenRes = await http.post(Uri.parse('$url/tokenIsValid'),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenRes.body);

      if(response == true)
        {
          //get user data
          http.Response userRes = await http.post(Uri.parse('$url/'),
              headers: <String, String>{
                'Content-type': 'application/json; charset=UTF-8',
                'x-auth-token': token
              });

          var userProvider = Provider.of<UserProvider>(context,listen: false);
          userProvider.setUser(userRes.body);
        }

    } catch (e) {
      showSnackbar(context, e.toString(), Colors.red);
    }
  }


}
