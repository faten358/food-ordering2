import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering2/core/enums/message_file.dart';
import 'package:food_ordering2/ui/shared/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering2/ui/shared/util.dart';

class CoustomToast{
  static showMessage({
   //required BuildContext context,
   required String message,
   MessageType messageType = MessageType.INFO,  }){
    String imageName = 'info';
    Color shadowColor = AppColors.blueButtonColor;

    switch (messageType){
      case MessageType.INFO:
      imageName = 'info';
      shadowColor = AppColors.mainOrangeColor;
      break;

      
      case MessageType.WARNING:
      imageName = 'warning';
      shadowColor = AppColors.redButtonColor;
        break;

      case MessageType.REJECTED:
      imageName = 'rejected-01';
      shadowColor = AppColors.mainOrangeColor;
        break;
        
      case MessageType.SUCCESS:
      imageName = 'approved1-01';
      shadowColor = AppColors.mainOrangeColor;
        break;
    }
    BotToast.showCustomText(
      duration: Duration(seconds: 5),
      toastBuilder: (value){
       // final size=MediaQuery.of(context).size;
        return Container(
          width: screenWidth(2),
          height: screenHeight(2),
          decoration: BoxDecoration(
            color: AppColors.mainWhiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [ BoxShadow(
              color: shadowColor.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
            ]
          ),

      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('images/$imageName.svg', width: screenWidth(2), height: screenHeight(2),),
          SizedBox(height: screenHeight(2)),
          Text(message, style: TextStyle(fontSize: screenWidth(2)),),
        ],
      ),
        );
      }
      
      
      );
   }
}