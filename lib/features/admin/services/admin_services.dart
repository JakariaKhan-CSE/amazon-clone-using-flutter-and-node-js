// for Admin api calling
import 'dart:io';

import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/model/products.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    try{
          final cloudinery = CloudinaryPublic('dzmioayqa', 'ezd33bco');
          List<String> imageUrls = [];

          for(int i=0; i<images.length; i++)
            {
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
    }catch(e)
    {
      showSnackbar(context, e.toString(), Colors.red);
    }
  }
}