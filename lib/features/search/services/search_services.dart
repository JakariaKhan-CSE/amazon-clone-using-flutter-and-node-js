import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/error_handling.dart';
import '../../../constants/global_variable.dart';
import '../../../constants/utils.dart';
import '../../../model/products.dart';
import '../../../provider/user_provider.dart';

class SearchServices{
  Future<List<Product>> fetchSearchProduct({required BuildContext context, required String searchQuery})async{
    List<Product> products = [];
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    try
    {

      http.Response res = await http.get(Uri.parse('$url/api/products/search/$searchQuery'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
      );

      httpErrorHandling(response: res, context: context, onSuccess: (){


        // print('jsonDecode(res.body).length: ${jsonDecode(res.body).length}');

        for(int i=0; i<jsonDecode(res.body).length; i++)  // total list(decode kora not object) er length
            {
          // print('loop ${i} product add working');
          products.add(Product.fromMap(jsonDecode(res.body)[i]));
          // i get error long time here
        }
      });
    }
    catch(e)
    {
      showSnackbar(context, e.toString(), Colors.red);
    }


    // print('before return product. is length: ${products.length}');
    return products;
  }
}