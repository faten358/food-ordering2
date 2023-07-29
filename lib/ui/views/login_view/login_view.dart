
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ordering2/app/my_app.dart';

import 'package:food_ordering2/core/enums/request_status.dart';
import 'package:food_ordering2/core/enums/request_status.dart';
import 'package:food_ordering2/core/enums/request_status.dart';
import 'package:food_ordering2/core/enums/request_status.dart';
import 'package:food_ordering2/core/translations/app_translations.dart';
import 'package:food_ordering2/ui/shared/color.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:food_ordering2/ui/shared/util.dart';
import 'package:food_ordering2/ui/views/login_view/login_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:get/utils.dart';

import '../../../core/enums/request_status.dart';
import '../../../core/enums/request_status.dart';
import '../../../core/enums/request_status.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                //for multi languages
                IconButton(
                  icon: Icon(
                    Icons.language,
                  ),
                  onPressed: () {
                    //getX included Dialog
                    Get.defaultDialog(
                        title: 'Change Language',
                        content: Column(
                          children: [
                            TextButton(
                                onPressed: () {
                                  storage.setAppLanguage(
                                      'en');
                                  Get.updateLocale(getLocal());
                                  Get.back();
                                },
                                child: Text('English')),
                            TextButton(
                                onPressed: () {
                                  storage.setAppLanguage(
                                      'ar');
                                  Get.updateLocale(getLocal());
                                  Get.back();
                                },
                                child: Text('العربية')),
                          ],
                        ));
                  },
                ),
                SizedBox(
                  height: size.width * 0.25,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainBlackColor),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.01, bottom: size.width * 0.1),
                  child: Text(
                    'Add your details to login',
                    style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.normal,
                        color: AppColors.mainBlackColor),
                  ),
                ),
                CustomTextField(
                  hintText: 'Your Email',
                  controller: controller.emailController,
                  validation: (value) {
                    //getutils from package getX
                    if (value!.isEmpty || !GetUtils.isEmail(value)) {
                      return 'please check your email';
                    }
                  },
                ),
                CustomTextField(
                  hintText: 'password',
                  controller: controller.passwordController,
                  validation: (value) {
                    if (value!.isEmpty || isPassword(value)) {
                      return 'please enter your password';
                    }
                  },
                ),
                //for all logic in this view we putted inside Obx
                //i removed obx becouse we putted full lock screen
                    CustomButton(
                        text: tr("key_login"),
                        onPressed: () {
                          controller.login();
                        }
                    ),
                  
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.06, bottom: size.width * 0.1),
                  child: Text(
                    'Forget password',
                    style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.normal,
                        color: AppColors.mainBlackColor),
                  ),
                ),
                Text(
                  'or Login With',
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.normal,
                      color: AppColors.mainBlackColor),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.06, bottom: size.width * 0.06),
                  child: CustomButton(
                    text: 'Login with Facebook',
                    backgroundColor: AppColors.mainBlackColor,
                    imageName: 'Facebook', onPressed: (){},
                  ),
                ),
                CustomButton(
                  text: 'Login with Google',
                  backgroundColor: AppColors.mainBlackColor,
                  imageName: 'google-plus-logo', onPressed: (){},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}



// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:food_ordering2/core/data/network/endpoints/user_endpoints.dart';
// import 'package:food_ordering2/core/data/network/network_config.dart';
// import 'package:food_ordering2/core/data/repositories/user_repositories.dart';
// import 'package:food_ordering2/core/enums/message_file.dart';
// import 'package:food_ordering2/core/data/repositories/shared_preferance_repository.dart';
// import 'package:food_ordering2/core/enums/request_type.dart';
// import 'package:food_ordering2/core/utils/network_util.dart';
// import 'package:food_ordering2/ui/shared/color.dart';
// import 'package:food_ordering2/ui/shared/custom_widgets/custom_button.dart';
// import 'package:food_ordering2/ui/shared/custom_widgets/custom_text.dart';
// import 'package:food_ordering2/ui/shared/custom_widgets/custom_text_field.dart';
// import 'package:food_ordering2/ui/shared/custom_widgets/custom_toast.dart';
// import 'package:food_ordering2/ui/shared/util.dart';

// import 'package:food_ordering2/ui/views/intro_view/intro_view.dart';
// import 'package:food_ordering2/ui/views/main_view/main_view.dart';
// import 'package:food_ordering2/ui/views/main_view/main_view_widgets/botton_navigation_widget.dart';
// import 'package:food_ordering2/ui/views/new_password/new_password_view.dart';
// import 'package:food_ordering2/ui/views/reset_password/reset_password_view.dart';
// import 'package:food_ordering2/ui/views/verification_password/verification_password_view.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
  
// TextEditingController emailController = TextEditingController();
// TextEditingController passwordController = TextEditingController();
// //general programimg for all validation
// GlobalKey<FormState> _formkey = GlobalKey<FormState>();
// //for test if we have any request to server
// bool isLoading= false;
// //for shared preferance
// String email = 'faten123@gmail.com';
// String password = 'Faten@2000';


//   @override
//   Widget build(BuildContext context) {
//     final size=MediaQuery.of(context).size;
//     return SafeArea(child: Scaffold(
//       body: Form(
//         key: _formkey,
//         child: Column(children: [40.ph,
//           Center(
//             child:
           
//             CustomText(text: 'Login',textSize: size.width*0.08,),
//           ),
//           15.ph,
          
//           CustomText(text: 'Add your details to Login'),
      
//           40.ph,
//           CustomTextField(
//             hintText: 'Your Email',
//             controller: emailController,
//             //this value mean control.text
//             Validator: (value){
//             return value!.isEmpty ||!isEmail(value) 
//                  ? 'please check Email'
//                  : null;}

//             //       if (value!.isEmpty) {
//             //       return('Please enter email');
//             //     } else if (!isEmail(value)) {
//             //       return('Invalid email');
//             //     } else{
//             //       // this mean don't show anything for customer (valid)
//             //       return null;}
//             // }
//             ),
            
//           20.ph,
//           CustomTextField(
//             hintText: 'Password',
//             controller: passwordController,
//             Validator: (value) {
//              return value!.isEmpty ||!isPassword(value) 
//             ? 'please check password'
//              : null;

//               //if(value!.isEmpty ||!isPassword(value))
//                // return'please check password';
//                //else 
//              // return null;
//                   // this mean don't show anything for customer (valid)
                  
//             },
//             ),
//           20.ph,

//           isLoading? SpinKitCircle(
//             color: AppColors.mainOrangeColor,
//         )
//          : CustomButton(
//             text: 'Login',
//             onPressed: (){

//               {
//                           setState(() {
//                             isLoading = true;
//                           });

//                           UserRepository()
//                               .login(
//                                   email: emailController.text,
//                                   password: passwordController.text)
//                               .then((value) {
//                                 //fold return left and right
//                             value.fold((l) {
//                               setState(() {
//                                 isLoading = false;
//                               }); 
//                               CoustomToast.showMessage(
//                                   context: context,
//                                   message: l,
//                                   messageType: MessageType.REJECTED);
//                             }, (r) {
//                               SharedPreferanceRepositories.setIsLogedin(true);
//                               SharedPreferanceRepositories.setTokenInfo(r);

//                               Navigator.pushReplacement(context,
//                                   MaterialPageRoute(
//                                 builder: (context) {
//                                   return MainView();
//                                 },
//                               ));
//                             });
//                           });

//                         }

//               // //for API
//               // NetworkUtil.sendRequest(
//               //                 type: RequestType.POST,
//               //                 url: UserEndspoints.login,
//               //                 headers: 
//               //                   NetworkConfig.getHeaders(needAuth: false),
//               //                 body: {
//               //                   "userName": "Test@gmail.com",
//               //                   "password": "Test@1234"
//               //                 });
              
//                 // if (_formkey.currentState!.validate()) {
//                 //   if(emailController.text== email && passwordController.text==password){
//                 //       SharedPreferanceRepositories.setIsLogedin(true);
//                 //          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//                 //  return MainView();
//                 // },
//                 //   ));};
//               //     print('Everything OK');
//               //     CoustomToast.showMessage(
//               //       context: context, 
//               //       message: 'message',
//               //       messageType: MessageType.SUCCESS);
//               //     //for test if we have any request to server
//               //     setState(() {
//               //       isLoading =true;
//               //     });
//               //     Future.delayed(Duration(seconds: 3)
//               //     ).then((value) => {
//               //     setState(() {
//               //       isLoading=false;

//               //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//               //   return IntroView();
//               //  },));

//               //  }
//               //  )
//               //     });
//             //     } else {
//             //       print(' :(');
//             //       } ;
               
//              }),
//             20.ph,
           
//           CustomText(text: 'Forget your Password?'),
      
//           75.ph,
          
//           CustomText(text: 'Or Loging with'),
      
//           20.ph,
//           CustomButton(
//             text: 'Login with Facebook',
//             backgroundColor: AppColors.blueButtonColor,
//             svgName: 'Facebook',
//             onPressed: (){
//                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//                  return MainView();
//                    }));

//               //  if (emailController.text.isEmpty) {
//               //     print('Please enter email');
//               //   } else if (!isEmail(emailController.text)) {
//               //     print('Invalid email');
//               //   }
//             }),
//             20.ph,
//             CustomButton(
//             text: 'Login with Google',
//             svgName: 'google-plus-logo',
//             backgroundColor: AppColors.redButtonColor,
//             onPressed: (){
//               //  if (emailController.text.isEmpty) {
//               //     print('Please enter email');
//               //   } else if (!isEmail(emailController.text)) {
//               //     print('Invalid email');
//               //   }
//             }),
//       Spacer(),
            
//             Row(mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//           CustomText(text: "Don't have an account? "),
//           CustomText(text: " Sign Up",
//             textColor:  AppColors.mainOrangeColor,
//           ),
      
//             ],),
          
//        20.ph,     ],),
//       ),
//     ));
//   }
// }


// extension EmptyPadding on num {
// SizedBox get ph => SizedBox(height: toDouble());
// SizedBox get pw => SizedBox(width: toDouble());
// }