import 'package:flutter/material.dart';
import 'package:food_ordering2/ui/shared/color.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPasswordView extends StatefulWidget {
  const VerificationPasswordView({super.key});

  @override
  State<VerificationPasswordView> createState() => _VerificationPasswordViewState();
}

class _VerificationPasswordViewState extends State<VerificationPasswordView> {
TextEditingController textEditingController = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(body: Column(
      children: [
        Padding(
            padding:  EdgeInsets.only(top: size.height*0.04),
            child: CustomText(text: 'We have sent an OTP to \n          your Mobile',textSize: size.width*0.05,),
          ),
          SizedBox(width: size.width*0.05,height: size.height*0.03,),
          CustomText(text: '    Please check your mobile number 071*****12 \n           continue to reset your password',
           textColor: AppColors.grayColor,),
          SizedBox(width: size.width*0.05,height: size.height*0.05,),


        PinCodeTextField(
  //for animation
  appContext: context,
  //number of squer
  length: 4,
  //for * or number, the same hint
  obscureText: false,
  //fade the maen disappare
  animationType: AnimationType.fade,
  hintCharacter: '*',
  //for shape of pin
  pinTheme: PinTheme(
    disabledColor: AppColors.mainWhiteColor,
    inactiveFillColor: AppColors.textFieldHintColor,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    inactiveColor: AppColors.textFieldHintColor,
    fieldHeight: 50,
    fieldWidth: 50,
    activeFillColor: Colors.white,
  ),
  animationDuration: Duration(milliseconds: 300),
  //for widget all
  //backgroundColor: Colors.blue.shade50,
  enableActiveFill: true,
  controller: textEditingController,
  // v is for all feild
  onCompleted: (v) {
    print("Completed");
  },
  onChanged: (value) {
    print(value);
    setState(() {
      
    });
  },
  beforeTextPaste: (text) {
    print("Allowing to paste $text");
    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
    //but you can show anything you want here, like your pop up saying wrong paste format or etc
    return true;
  },
),
          SizedBox(width: size.width*0.05,height: size.height*0.03,),
         
          CustomButton(text: 'Next', onPressed: (){}, imageName: '',),
          SizedBox(width: size.width*0.05,height: size.height*0.03,),

         Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
          CustomText(text: "Didn't Receive?  "),
          CustomText(text: " Click Here",
            textColor:  AppColors.mainOrangeColor,
          ),
      
            ],),

      ],
    ),));
  }
}