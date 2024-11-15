import 'package:amazon_clone/common/widget/customButton.dart';
import 'package:amazon_clone/common/widget/stars.dart';
import 'package:amazon_clone/features/products_details/services/product_details_services.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variable.dart';
import '../../../model/products.dart';
import '../../search/screen/search_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsServices productDetailsServices = ProductDetailsServices();
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }
  double avgRating = 0;
  double myRating = 0;
  @override
  void initState() {
    double totalRating = 0;

    if(widget.product.rating != null)
      {
        for(int i=0; i<widget.product.rating!.length; i++)
        {
          totalRating += widget.product.rating![i].rating;
          if(widget.product.rating![i].userId == Provider.of<UserProvider>(context,listen: false).user.id)
          {
            myRating = widget.product.rating![i].rating;
          }
        }
      }
    if(totalRating != 0)
      {
        avgRating = totalRating/widget.product.rating!.length;
      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        // default appbar na niye  aita neyar karon hosse appbar er height issa moto korbo
        preferredSize: const Size.fromHeight(
            60), // aitar size joto dibo appbar er size totp hobe
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted:
                          navigateToSearchScreen, // very important onFieldSubmitted( detect keyboard enter hit to run)
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: const BorderSide(
                                  color: Colors.black38, width: 1)),
                          hintText: 'Search Amazon.in',
                          hintStyle: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ),
              Container(
                height: 42,
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.id!),
                   Stars(rating: avgRating),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                widget.product.name,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            CarouselSlider(
              items: widget.product.images.map((i) {
                return Image.network(
                  i,
                  fit: BoxFit.contain,
                  height: 200,
                );
              }).toList(),
              options: CarouselOptions(
                  viewportFraction:
                      1, // aita na dile screen a 2 ta picture cole ashse. aita diyer pore screen a akta picture show korbe
                  height: 300),
            ),
            Container(
              // divider deya hosse
              height: 5,
              color: Colors.black12,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                text: TextSpan(
                    text: 'Deal Price: ',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: '\$${widget.product.price}',
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.w500))
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.description),
            ),
            Container(
              // divider deya hosse
              height: 5,
              color: Colors.black12,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomButton(text: 'Buy Now', onTap: () {}),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomButton(
                  color: Colors.orangeAccent,
                  text: 'Add to Cart',
                  onTap: () {}),
            ),
            Container(
              // divider deya hosse
              height: 5,
              color: Colors.black12,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Rate the Product',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            RatingBar.builder(  // user issa moto rating dite parbe
              initialRating: myRating,
              minRating: 1,
              allowHalfRating: true, // user half rating dite parbe
              direction: Axis.horizontal,
              itemCount: 5,   // start er number issa moto barano jabe
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: GlobalVariables.secondaryColor,
                    ),
                onRatingUpdate: (rate) {
productDetailsServices.rateProduct(context: context, product: widget.product, rating: rate);
                },)
          ],
        ),
      ),
    );
  }
}
