import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/model/products.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../model/users.dart';

class ProductDetailsServices{
  void addToCart({
    required BuildContext context,
    required Product product,


  })async{
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    try{
      http.Response res = await http.post(Uri.parse('$url/api/rate-product'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token
          },body:jsonEncode({
            'id': product.id,     // product id and rating body te send hosse

          }) );

      httpErrorHandling(response: res, context: context, onSuccess: (){
        User.fromMap(jsonDecode(res.body));
      });
    }catch(e)
    {
      showSnackbar(context, e.toString(), Colors.red);
    }
  }

  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating

})async{
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    try{
        http.Response res = await http.post(Uri.parse('$url/api/rate-product'),
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': userProvider.user.token
        },body:jsonEncode({
              'id': product.id,     // product id and rating body te send hosse
              'rating': rating
            }) );

        httpErrorHandling(response: res, context: context, onSuccess: (){});
    }catch(e)
    {
      showSnackbar(context, e.toString(), Colors.red);
    }
  }
}