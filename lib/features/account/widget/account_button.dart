import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AccountButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(  // available all space niye nibe. aita na dile button golor align gulo thik thakse na
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(50),
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: Colors.black.withOpacity(0.03)  // background a grey color ana hosse
          ),
          onPressed: onTap,
          child: Text(text,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
        ),
      ),
    );
  }
}
