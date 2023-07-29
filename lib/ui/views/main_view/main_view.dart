import 'package:flutter/material.dart';
import 'package:food_ordering2/core/enums/buttom_navigation.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_drawer.dart';

import 'package:food_ordering2/ui/views/main_view/home_view/home_view.dart';
import 'package:food_ordering2/ui/views/main_view/main_view_widgets/botton_navigation_widget.dart';
import 'package:food_ordering2/ui/views/main_view/menu_view/menu_view.dart';
import 'package:food_ordering2/ui/views/main_view/more_view/more_view.dart';
import 'package:food_ordering2/ui/views/main_view/offers_view/offers_view.dart';

import 'profile_view/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  ButtomNavigationEnum select = ButtomNavigationEnum.HOME;
  PageController controler = PageController(initialPage: 2);
  //for drawer
  GlobalKey<ScaffoldState> key=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        //for drawer
        key: key,
        drawer: CustomDrawer(),
        //backgroundColor: AppColors.mainBlackColor,
        bottomNavigationBar: BottomNavigationWidget(
          buttonNavication: select,
           onTap: (selected, pageNuber ) { 
              setState(() {
                select = selected;
              });
                controler.jumpToPage(pageNuber);
            },),
            body: PageView (
              //for no swap right and left
              physics: NeverScrollableScrollPhysics(),
              controller: controler,
              children: [
                MenuView(),
                OffersView(),
                HomeView(onPressed: (){
                  key.currentState!.openDrawer();
                },),
                ProfileView(),
                MoreView(),
              ],
            ),

      ),
    );
  }
}