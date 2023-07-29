
import 'dart:io' as prefix;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ordering2/ui/shared/color.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_text.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:food_ordering2/ui/shared/util.dart';
import 'package:image_picker/image_picker.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController mobilenoController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmpasswordController = TextEditingController();
GlobalKey<FormState> _formkey=GlobalKey<FormState>();
bool isLoading=false;

  // late XFile? image; //for caputred image
  // final ImagePicker _picker = ImagePicker();
   XFile? image;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return SafeArea(child: Scaffold(
      body: Form(
        key: _formkey,
        child: 
        
        Column(children:
        
         [40.ph,
        
        InkWell(onTap: (){pickImage();},
          child: 
               Container(
                  width: size.width*0.3,
                  height: size.height*0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: FileImage(image as prefix.File),
                      fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle
                  ),
              ) ),
        
              
          Center(child: CustomText(text: 'Sign Up',textSize: size.width*0.08,)),
          15.ph,
          CustomText(text: 'Add your details to Sign Up'),
          20.ph,
      
          CustomTextField( 
            hintText: 'Name',
            controller: nameController,
            Validator: (value) {
                return value!.isEmpty || !isName(value)?
                'check your name'
                :null;

            }, validation: (value) {  },
            ),
          15.ph,
      
          CustomTextField( 
            hintText: 'Email',
            controller: emailController,
            Validator: (value) {
               return value!.isEmpty || !isEmail(value)?
               'check your email'
              : null;
            }, validation: (value) {  },
            ),
          15.ph,
      
          CustomTextField( 
            hintText: 'Mobile No',
            controller: mobilenoController,
            Validator: (value) {
              return value!.isEmpty || !isMobileNumber(value)?
              'check your mobile number'
              :null;
            }, validation: (value) {  },
            ),
          15.ph,
      
          CustomTextField( hintText: 'Address',controller: addressController, validation: (value) {  },),
          15.ph,
      
          CustomTextField( 
            hintText: 'Password',
            controller: passwordController,
            Validator: (value) {
                return value!.isEmpty || !isPassword(value)
                ?'check your password'
              : null;
            }, validation: (value) {  },
            ),
          15.ph,
      
          CustomTextField( hintText: 'Confirm Password',controller: confirmpasswordController, validation: (value) {  },),
          15.ph,
      
      isLoading? SpinKitCircle(color: AppColors.mainOrangeColor,)
          :CustomButton(
            text: 'Sign Up', 
            onPressed: (){
                if (_formkey.currentState!.validate()) {
                  print('Everything OK');
                  setState(() {
                    isLoading =false;
                  });
                  Future.delayed(Duration(seconds: 3)
                  ).then((value) => {
                  setState(() {
                    isLoading=false;
                  })
                 } );
                } else {
                  print(' :(');
                  } ;

            }, imageName: '',),

            CustomButton(text: 'camera', onPressed: () async {
              
            }, imageName: '',
            ),
          50.ph,
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
          CustomText(text: "Alraedy have an account? "),
          CustomText(text: " Login",
            textColor:  AppColors.mainOrangeColor,
          ),
      
            ],),]))));
  }
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
if(image == null)
   return;
    final imageTemp = XFile(image.path);
      setState(() => this.image = imageTemp);
    } 
      on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
}

extension EmptyPadding on num {
SizedBox get ph => SizedBox(height: toDouble());
SizedBox get pw => SizedBox(width: toDouble());
}


