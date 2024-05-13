import 'dart:convert';

import 'package:amazon_clone/model/rating.dart';

class Product{
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;
  final String? userId;
  final List<Rating>? rating;

  Product({required this.name, required this.description, required this.quantity, required this.images, required this.category, required this.price, this.id, this.userId,this.rating,});

  Map<String,dynamic> toMap()
  {

    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      'rating': rating
    };
  }

  factory Product.fromMap(Map<String,dynamic> map)
  {

    return Product(
        name: map['name'] ?? '',  // value null hole '' assign hobe (?? '')
        description: map['description']??'',
        quantity: map['quantity']?.toDouble()??0.0,  // double a convert kora hosse null hole 0.0 assign hobe
        images: List<String>.from(map['images'] ?? []),  // see carefully
        category: map['category']??'',
        price: map['price']?.toDouble()??0.0,
      id: map['_id'],     // mongodb database a _id aivabe thake
      rating: map['rating'] != null
          ? List<Rating>.from(
        map['rating']?.map(
              (x) => Rating.fromMap(x),
        ),
      )
          : null,
    );

  }

  String toJson()=>json.encode(toMap());  // map a convert hoye oita jsonencode hobe backend jawar jonno

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}