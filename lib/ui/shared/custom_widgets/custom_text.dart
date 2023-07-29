import 'package:flutter/material.dart';
import 'package:food_ordering2/ui/shared/color.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.textColor, this.textSize, this.textFontWeight});

final String text;
final Color? textColor;
final double? textSize;
final FontWeight? textFontWeight;


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Text(
      text,
      style: TextStyle(
        color: textColor?? AppColors.grayColor,
        fontSize: textSize ?? size.width * 0.035,
        fontWeight: textFontWeight ?? FontWeight.normal,
      ),

    );
  }
}