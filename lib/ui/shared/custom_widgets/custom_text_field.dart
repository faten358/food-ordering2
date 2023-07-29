
import 'package:flutter/material.dart';
import 'package:food_ordering2/ui/shared/color.dart';
import 'package:food_ordering2/ui/shared/util.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.hintText, required this.controller, this.Validator, this.prifText, required String? Function(dynamic value) validation});


final String hintText;
final Icon? prifText;
final TextEditingController controller;
final String? Function(String?)? Validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  

  
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SizedBox(width: size.width*0.9,
      child: TextFormField(
        validator:widget.Validator,
        controller: widget.controller,
        style: TextStyle(
          fontSize: size.width*0.04,
          color: AppColors.mainBlackColor,
          fontWeight: FontWeight.normal
        ),
        
        decoration: InputDecoration(
          errorStyle: TextStyle(color: AppColors.mainOrangeColor, fontSize: size.width*0.035),
          hintText: widget.hintText,
          prefixIcon: widget.prifText,
          hintStyle: TextStyle(
            fontSize: size.width*0.035,
            color: AppColors.textFieldHintColor,
            fontWeight: FontWeight.normal,
          ),
          filled: true,
          fillColor: AppColors.textFieldBgColor,
          contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(size.width * 0.05),
          )
        ),
      ),
    )
  ;
  }
}