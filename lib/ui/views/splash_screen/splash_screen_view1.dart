import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering2/ui/shared/util.dart';
import 'package:food_ordering2/ui/views/splash_screen/splashscreen_controller.dart';
import 'package:get/get.dart';

import '../../shared/color.dart';

class SplashScreenView1 extends StatefulWidget {
  const SplashScreenView1({super.key});

  @override
  State<SplashScreenView1> createState() => _SplashScreenView1State();
}

class _SplashScreenView1State extends State<SplashScreenView1> {

@override

SplashScreenController controller = Get.put(SplashScreenController());
// void initState() {
//   Future.delayed(Duration(seconds: 100))
//         .then((value) { 
//           //for test if user the first entry
//           if(SharedPreferanceRepositories.getFirstLunch()){
//             //get.off replace by navigator.pushreplesment
//             Get.off(IntroView()); 
//           }
//           else {
//             SharedPreferanceRepositories.getIsLogedin()
//               ? Get.off(MainView())
//               : Get.off(LandingView());
            
//           }
          
//           //
//           SharedPreferanceRepositories.setFirstLunch(false);
//             }
//             );

//   super.initState();
  
// }

  @override
  Widget build(BuildContext context) {

   // final size=MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset('images/bg_background.svg',
            width: screenWidth(1),
          height: screenHeight(1)
          ),
          Center(child:
            SvgPicture.asset('images/Logo.svg',
              width: screenWidth(3),
              height: screenHeight(3)),
          ),
          Padding(
          padding: EdgeInsets.only(top: screenHeight(2)),
          child: SpinKitThreeBounce(
            color: AppColors.mainOrangeColor,
          ),
        )
        ],
      ),

    ));
  }
}