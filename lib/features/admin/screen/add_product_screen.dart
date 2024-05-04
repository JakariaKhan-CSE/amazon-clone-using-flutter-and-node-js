import 'package:amazon_clone/common/widget/customButton.dart';
import 'package:amazon_clone/common/widget/custom_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variable.dart';
import '../../../provider/user_provider.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    // dispose are very important for memory management. don't ignore it
    priceController.dispose();
    productNameController.dispose();
    quantityController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  String category = 'Mobiles'; // for default show
  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        // default appbar na niye  aita neyar karon hosse appbar er height issa moto korbo
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Text(
            'Add Product',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 22,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                DottedBorder(
                    strokeCap: StrokeCap.round,
                    borderType: BorderType
                        .RRect, // default rectangle thake aitake rounded korarar jonno aita
                    radius: Radius.circular(10),
                    dashPattern: [
                      10,
                      4
                    ], // prothom ta each dotted er size barabe, r 2 number ta dotted number barabe
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.folder_open,
                            size: 40,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Select Product Images',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade400),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                    controller: productNameController,
                    hintText: 'Product Name'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxline: 7,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(controller: priceController, hintText: 'Price'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: quantityController, hintText: 'Quantity'),
                SizedBox(
                    width: double.infinity,  // entire width a click korlei dropdown show korbe
                    child: DropdownButton(
                      value: category,
                      icon: Icon(Icons.arrow_drop_down_outlined),
                      items: productCategories.map((String item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          category = newValue!;
                        });
                      },
                    )),
                SizedBox(height: 10,),
                CustomButton(text: 'Sell', onTap: (){

                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
