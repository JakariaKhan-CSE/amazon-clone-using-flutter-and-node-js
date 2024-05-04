import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int maxline;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      // required this.maxline    // aivabe dile entire code modify korte hobe tai
        this.maxline = 1   // default value 1 set kore dissi jodi user na dei aita otherwise user jeita dibe seita
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black38)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText'; // see this
        }
        return null;
      },
    );
  }
}
