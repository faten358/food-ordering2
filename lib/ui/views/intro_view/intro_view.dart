import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering2/ui/shared/color.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_ordering2/ui/views/landing_view/landing_view.dart';
import 'package:get/get.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {

  List<String> titalList=[
    'Find Food You Love',
    'Fast Delivery',
     'Live Tracking'
  ];
  List<String> descriptionList=[
    'Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep',
    'Fast food delivery to your home, office \n wherever you are',
     'Real time tracking of your food on the app \n once you placed the order'
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(body: Padding(
      padding:  EdgeInsets.symmetric(horizontal:size.width*0.05 , vertical:size.height*0.02 ),
      child: Column(
        children: [
          SvgPicture.asset('images/intro$currentIndex.svg'),
          Padding(
            padding:  EdgeInsets.only(top: size.width*0.05, bottom: size.height*0.1),
            child: DotsIndicator(
              dotsCount: 3,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(
              color: Colors.black87, // Inactive color
              activeColor: AppColors.mainOrangeColor,
                ),
              ),
          ),
    
      Text(titalList[currentIndex], style: TextStyle(fontSize: size.width*0.06, fontWeight: FontWeight.bold),),
      Padding(
        padding: EdgeInsets.only(top: size.width*0.04),
        child: Text(descriptionList[currentIndex], textAlign: TextAlign.center,style: TextStyle(fontSize: size.width*0.04),),
      ),
      Spacer(),
    CustomButton(text: currentIndex != 2 ? 'Next' : 'Finish', onPressed: (){
      if(currentIndex != 2 ){
      setState(() {
        currentIndex = currentIndex + 1 ;
  });
      }else
      Get.off(LandingView());
    }, imageName: '',)
        ],
      ),
    ),));
  }
}