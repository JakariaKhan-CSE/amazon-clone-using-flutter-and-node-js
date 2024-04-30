import 'dart:convert';

import 'package:amazon_clone/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
void httpErrorHandling({required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess}){
switch(response.statusCode)
    {
  case 200:
    onSuccess();
    break;
  case 400:
    showSnackbar(context, jsonDecode(response.body)['msg'], Colors.red);
    break;
  case 500:
    showSnackbar(context, jsonDecode(response.body)['error'], Colors.red);
  default:
    showSnackbar(context, response.body, Colors.green);
    }


}