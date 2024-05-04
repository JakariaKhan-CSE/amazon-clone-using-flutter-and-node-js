import 'package:amazon_clone/constants/global_variable.dart';
import 'package:flutter/cupertino.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,  // height mention na korle error dibe
      child: ListView.builder(
        itemExtent: 75,// each item 75 kore extend hobe
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(GlobalVariables.categoryImages[index]['image']!,fit: BoxFit.cover,
                    width: 40,height: 40,),
              ),
            ),
            Text(GlobalVariables.categoryImages[index]['title']!,style: TextStyle(fontSize: 12,
            fontWeight: FontWeight.w400),)
          ],
        );
      },),
    );
  }
}