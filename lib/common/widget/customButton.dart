import 'package:amazon_clone/constants/global_variable.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: Text(text,style: TextStyle(
      color: color==null?Colors.white:Colors.black
    ),),
    style: ElevatedButton.styleFrom(

      backgroundColor: color==null? GlobalVariables.secondaryColor: color,
      foregroundColor: GlobalVariables.backgroundColor,
      minimumSize: const Size(double.infinity, 50)
    ),
    );
  }
}
