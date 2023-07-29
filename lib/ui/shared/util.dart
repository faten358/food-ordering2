import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ordering2/core/data/repositories/shared_preferance_repository.dart';
import 'package:food_ordering2/core/services/cart_service.dart';
import 'package:food_ordering2/core/services/location_service.dart';
import 'package:food_ordering2/ui/shared/color.dart';
import 'package:get/get.dart';

bool isEmail(String value) {
  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

//for validation passsword
 bool isPassword(String value){
        String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value);
  }
// for validation name
   bool isName(String value){
        String  pattern = '!@#<>?":_``~;[]\|=-+)(*&^%1234567890';
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value);
  }

  // for validation mobule number
   bool isMobileNumber(String value){
        String  pattern = r'^(?:[+0]9)?[0-9]{10}$';
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value);
  }

  double screenWidth(double percent){
    return Get.size.width / percent;
  }

   double screenHeight(double percent){
    return Get.size.height / percent;
  }

  //we putted sharedpreferancerepositry here in general becouse we used all of the time
  SharedPreferanceRepositories get storage => Get.find<SharedPreferanceRepositories>();

  CartService get cartService => Get.find<CartService>();
  LocationService get locationservice => Get.find<LocationService>();


  //for lock screen
  void customLoader() => BotToast.showCustomLoading(toastBuilder: (Builder){
    return Container(
      width: screenWidth(5),
      height: screenHeight(5),
      decoration: BoxDecoration(
        color: AppColors.redButtonColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15)
      ),
      child: SpinKitCircle(color: AppColors.mainOrangeColor),
    );
  });
  
//for cart service
double get taxAmount => 0.18;
double get deliveryAmount => 0.1;