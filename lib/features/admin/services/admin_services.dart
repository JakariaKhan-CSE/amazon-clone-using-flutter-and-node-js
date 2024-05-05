// for Admin api calling
import 'dart:io';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/model/products.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminServices{

  void sellProducts({
    required BuildContext context,
    required String name, // product name
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,})async
  {
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    try{
          final cloudinery = CloudinaryPublic('dzmioayqa', 'ezd33bco');
          List<String> imageUrls = [];

          for(int i=0; i<images.length; i++)
            {
              print('for loop: ${i}, images path: ${images[i].path}');
              CloudinaryResponse res = await  cloudinery.uploadFile(
                CloudinaryFile.fromFile(images[i].path, folder: name) //name(product) er folder er vitor sob image add hobr
              );
              imageUrls.add(res.secureUrl);  // cloud a host kora each image er url
            }

          // imageurl gulo mongodb te add korte hobe
      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price);
          // POST products with image
         http.Response res =await http.post(Uri.parse('$url/admin/add-product'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': userProvider.user.token
            },
            body: product.toJson()
          );

         httpErrorHandling(response: res, context: context, onSuccess: (){
           showSnackbar(context, 'Product Added Successfully', Colors.lightGreen);
           // back to admin homepage
           Navigator.pop(context);
         });
    }catch(e)
    {
      print('this is catch block error: ${e.toString()}');
      showSnackbar(context, e.toString(), Colors.red);
    }
  },

  // GET ALL THE PRODUCTS

}