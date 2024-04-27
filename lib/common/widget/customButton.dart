import 'package:amazon_clone/constants/global_variable.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: Text(text),
    style: ElevatedButton.styleFrom(
      backgroundColor: GlobalVariables.secondaryColor.withOpacity(0.5),
      foregroundColor: GlobalVariables.backgroundColor,
      minimumSize: Size(double.infinity, 50)
    ),
    );
  }
}