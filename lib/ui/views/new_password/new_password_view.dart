import 'package:flutter/material.dart';
import 'package:food_ordering2/ui/shared/color.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_text.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_text_field.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
TextEditingController passwordController = TextEditingController();
TextEditingController comfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(body: Center(
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: size.height*0.04),
            child: CustomText(text: 'New Password',textSize: size.width*0.08,),
          ),
          SizedBox(width: size.width*0.05,height: size.height*0.03,),

          CustomText(text: '    Please enter your email to receive a \n link to create a new password via email', textColor: AppColors.grayColor,),
          SizedBox(width: size.width*0.05,height: size.height*0.1,),
          CustomTextField(hintText: 'New Password', controller: passwordController, validation: (value) {  },),
          SizedBox(width: size.width*0.05,height: size.height*0.05,),

          CustomTextField(hintText: 'Comfirm Password', controller: comfirmPasswordController, validation: (value) {  },),
          SizedBox(width: size.width*0.05,height: size.height*0.05,),

          CustomButton(text: 'Next', onPressed: (){}, imageName: '',),
    
        ],
      ),
    ),));
  }
  }
