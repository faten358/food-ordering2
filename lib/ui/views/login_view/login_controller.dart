import 'package:flutter/material.dart';
import 'package:food_ordering2/core/data/repositories/user_repositories.dart';
import 'package:food_ordering2/core/enums/message_file.dart';
import 'package:food_ordering2/core/services/base_controller.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:food_ordering2/ui/shared/util.dart';
import 'package:food_ordering2/ui/views/main_view/main_view.dart';

import 'package:get/get.dart';

class LoginController extends BaseController {
  TextEditingController emailController =
      TextEditingController(text: 'Test@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Test@1234');

  //general programimg for all validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //for test if we have any request to server
  // .obs for monitoring(observe)
 

  void login() {
      // .value we must putted becouse getX packege
      
      //for API
      runFullLoadingFutureFunction(
        function:UserRepository()
          .login(email: emailController.text, password: passwordController.text)
          .then((value) {
        value.fold((l) {
          CoustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          storage.setIsLogedin(true);
          storage.setTokenInfo(r);
          Get.off(MainView());
        });
      }));
  
  }
      
      
}