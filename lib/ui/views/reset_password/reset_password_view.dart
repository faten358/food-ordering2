import 'package:flutter/material.dart';
import 'package:food_ordering2/ui/shared/color.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_text.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_text_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
TextEditingController emailController = TextEditingController();

  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(body: Center(
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: size.height*0.04),
            child: CustomText(text: 'Reset Password',textSize: size.width*0.08,),
          ),
          SizedBox(width: size.width*0.05,height: size.height*0.03,),

          CustomText(text: '    Please enter your email to receive a \n link to create a new password via email', textColor: AppColors.grayColor,),
          SizedBox(width: size.width*0.05,height: size.height*0.1,),
          CustomTextField(hintText: 'Email', controller: emailController, validation: (value) {  },),
          SizedBox(width: size.width*0.05,height: size.height*0.05,),

          CustomButton(text: 'Send', onPressed: (){}, imageName: '',),
    
        ],
      ),
    ),));
  }
}