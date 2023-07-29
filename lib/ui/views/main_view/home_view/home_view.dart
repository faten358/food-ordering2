//add state manegment
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering2/core/services/cart_service.dart';
import 'package:food_ordering2/ui/shared/color.dart';
import 'package:food_ordering2/ui/shared/util.dart';
import 'package:food_ordering2/ui/views/main_view/home_view/home_controller.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/shimmer_widget.dart';
import 'package:food_ordering2/ui/views/meal_details_view/meal_details_view.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  final Function onPressed;

  HomeView({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeController controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {

    var now = DateTime.now();
    var hour = now.hour;

    String greeting = '';

    if (hour < 12) {
      greeting = 'good morning';
    } else if (hour > 12 && hour < 18) {
      greeting = 'good afternoon';
    } else {
      greeting = 'good evening';
    }



    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.deepOrange[600]!));

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: Icon(Icons.drag_handle , color: Colors.transparent,),
            flexibleSpace: Padding(
              padding: EdgeInsetsDirectional.only(top: screenWidth(25) , start: screenWidth(25)),
              child: Text(
                '$greeting Akila!',
                style: TextStyle(fontSize: screenWidth(20) ,color: AppColors.mainBlackColor),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.only(end: screenWidth(25)),
                child: Padding(
                  padding: EdgeInsets.only(top: screenWidth(50)),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Icon(Icons.shopping_cart , color: AppColors.mainBlackColor,size: screenWidth(12),),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: screenWidth(20),
                          width: screenWidth(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red
                          ),
                          child: Obx(() {
                            print(
                                controller.categoryList.length);
                            return
                              Center(child: Text('${cartService.cartCount}'));

                          })
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          drawer: Container(
            color: AppColors.mainBlackColor,
          ),
          body:  Padding(
                  padding: EdgeInsetsDirectional.symmetric(vertical: screenWidth(40)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: screenWidth(30)),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: screenWidth(30)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delivering to',
                                style: TextStyle(
                                    color: AppColors.mainBlackColor,
                                    fontSize: screenWidth(30)),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Current Location',
                                    style: TextStyle(
                                      color: AppColors.mainBlackColor,
                                      fontSize: screenWidth(20),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: screenWidth(50)),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.mainOrangeColor,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenWidth(35)),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsetsDirectional.symmetric(
                              horizontal: screenWidth(30),
                              vertical: screenWidth(50)),
                          padding: EdgeInsetsDirectional.symmetric(
                              horizontal: screenWidth(30),
                              vertical: screenWidth(50)),
                          height: screenWidth(9),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[200],
                          ),
                          child: TextField(
                            cursorColor: AppColors.mainBlackColor,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.search,
                                color: AppColors.mainBlackColor,
                              ),
                              hintText: "Search food",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: screenWidth(30)),

                        Obx((){
                          return controller.isCategoryLoading
                              ? buildShimmer1()
                              : controller.categoryList.isEmpty
                              ? Text('No Category') : SizedBox(
                                  height: screenWidth(3.2),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: controller.categoryList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(start: screenWidth(30), end: screenWidth(40)),
                                            child: Container(
                                              width: screenWidth(5.2),
                                              height: screenWidth(5.2),
                                              child: CachedNetworkImage(
                                                imageUrl: 'https://insanelygoodrecipes.com/wp-content/uploads/2020/02/Burger-and-Fries.webp',
                                                placeholder: (context, url) => CircularProgressIndicator(),
                                                errorWidget: (context, url, error) => Icon(Icons.error),
                                                imageBuilder: (context, imageProvider) => Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(controller.categoryList[index].name ?? '' , style: TextStyle(fontSize: screenWidth(20)),),
                                        ],
                                      );
                                    },
                                  ),
                                );}
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                              vertical: screenWidth(30),
                              horizontal: screenWidth(50)),
                          child: Row(
                            children: [
                              Text(
                                'Popular Restaurants',
                                style: TextStyle(fontSize: screenWidth(20)),
                              ),
                              Spacer(),
                              Text(
                                'View all',
                                style: TextStyle(
                                    fontSize: screenWidth(25),
                                    color: AppColors.mainOrangeColor),
                              ),
                            ],
                          ),
                        ),
                        Obx((){
                          return controller.isMealLoading
                              ? buildShimmer2() : controller.mealList.isEmpty
                              ? Text('No Meal')
                              : ListView.builder(
                                primary: false,
                                scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: controller.mealList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: screenWidth(2),
                                          child: InkWell(
                                            onTap: (){Get.to(MealDetailsView(model: controller.mealList[index],));},
                                            child: CachedNetworkImage(
                                              imageUrl: 'https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/breadandbutterpuddin_85936_16x9.jpg',
                                              placeholder: (context, url) => CircularProgressIndicator(),
                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(start: screenWidth(30) , top: screenWidth(50) , bottom: screenWidth(35)),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Text(controller.mealList[index].name ?? '', style: TextStyle(fontSize: screenWidth(22)),),

                                              Row(
                                                children: [
                                                  Icon(Icons.star, color: AppColors.mainOrangeColor, size: screenWidth(20),),

                                                  SizedBox(width: screenWidth(50)),

                                                  Text(controller.mealList[index].description ?? '', style: TextStyle(fontSize: screenWidth(32)),),

                                                  SizedBox(width: screenWidth(40)),
                                                  
                                                  Spacer(),

                                                  Padding(
                                                    padding: EdgeInsetsDirectional.only(end: screenWidth(25)),
                                                    child: InkWell(
                                                      onTap: (){
                                                        //here  added button for add to cart without go to meal deatels
                                                        controller.addToCart(
                                                            controller.mealList[index]);
                                                      },
                                                        child: Container(
                                                          width: screenWidth(10),
                                                            height: screenWidth(15),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(50),
                                                              color: AppColors.mainOrangeColor
                                                            ),
                                                            child: Center(
                                                                child: Text('+' , style: TextStyle(fontSize: screenWidth(15) , color: Colors.white),))
                                                        )
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );}
                        ),
                        SizedBox(height: screenWidth(4)),
                      ],
                    ),
                  ),
                )
      )
    );
  }

  Widget buildShimmer1() => Container(
        height: MediaQuery.of(context).size.height * 0.09,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(start: 5, end: 5),
                child: Container(
                  child: ShimmerWidget.circular(
                    height: 70,
                    width: 75,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              );
            }),
      );

  Widget buildShimmer2() => Padding(
        padding: EdgeInsetsDirectional.all(10.0),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ShimmerWidget.circular(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(top: 10, start: 5),
                      child: ShimmerWidget.rectangular(
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                    )),
                             ]),
        ),
      );
}

          // FutureBuilder<List<dynamic>>(
          //     future: Future.wait([
          //       CategoryRepository().getAll(),
          //       MealRepository().getAll(),
          //     ]),
          //     builder: ((context, AsyncSnapshot<List<dynamic>> snapshot1) {
          //       var categories = snapshot1.data != null
          //           ? snapshot1.data![0]
          //               as dartz.Either<String, List<CategoryModel>>
          //           : null;
          //       var meals = snapshot1.data != null
          //           ? snapshot1.data![1]
          //               as dartz.Either<String, List<MealModel>>
          //           : null;

          //       if (snapshot1.connectionState != ConnectionState.waiting) {
          //         categories!.fold((l) {
          //           CustomToast.showMeassge(
          //               message: l, messageType: MessageType.REJECTED);
          //         }, (r) {
          //           categoryList.clear();
          //           categoryList.addAll(r);
          //         });


//         meals!.fold((l) {
          //           CustomToast.showMeassge(
          //               message: l, messageType: MessageType.REJECTED);
          //         }, (r) {
          //           mealList.clear();
          //           mealList.addAll(r);
          //         });
          //       }

          //       return Column(
          //         children: [
          //           categories == null
          //               ? SpinKitCircle(
          //                   color: AppColors.mainOrangeColor,
          //                 )
          //               : Expanded(
          //                   child: ListView.builder(
          //                     scrollDirection: Axis.horizontal,
          //                     shrinkWrap: true,
          //                     itemCount: categoryList.length,
          //                     itemBuilder: (BuildContext context, int index) {
          //                       return Column(
          //                         children: [
          //                           CachedNetworkImage(
          //                             imageUrl:
          //                                 'http://via.placeholder.com/350x150',
          //                             placeholder: (context, url) =>
          //                                 CircularProgressIndicator(),
          //                             errorWidget: (context, url, error) =>
          //                                 Icon(Icons.error),
          //                           ),
          //                           Text(
          //                             categoryList[index].name ?? '',
          //                             style: TextStyle(fontSize: 50),
          //                           ),
          //                         ],
          //                       );
          //                     },
          //                   ),
          //                 ),
          //           meals == null
          //               ? SpinKitCircle(
          //                   color: AppColors.mainOrangeColor,
          //                 )
          //               : Expanded(
          //                   child: ListView.builder(
          //                     scrollDirection: Axis.vertical,
          //                     shrinkWrap: true,
          //                     itemCount: mealList.length,
          //                     itemBuilder: (BuildContext context, int index) {
          //                       return Column(
          //                         children: [
          //                           CachedNetworkImage(
          //                             imageUrl:
          //                                 'http://via.placeholder.com/350x150',
          //                             placeholder: (context, url) =>
          //                                 CircularProgressIndicator(),
          //                             errorWidget: (context, url, error) =>
          //                                 Icon(Icons.error),
          //                           ),
          //                           Text(
          //                             mealList[index].name ?? '',
          //                             style: TextStyle(fontSize: 50),
          //                           ),
          //                         ],
          //                       );
          //                     },
          //                   ),
          //                 ),
          //         ],
          //       );
          //     }))






//before state manegment

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dartz/dartz.dart' as dartz;
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:food_ordering2/core/data/models/apis/category_model.dart';
// import 'package:food_ordering2/core/data/models/apis/meal_model.dart';
// import 'package:food_ordering2/core/data/repositories/category_repositories.dart';
// import 'package:food_ordering2/core/data/repositories/meal_repositories.dart';
// import 'package:food_ordering2/core/enums/message_file.dart';
// import 'package:food_ordering2/ui/shared/color.dart';
// import 'package:food_ordering2/ui/shared/custom_widgets/custom_button.dart';
// import 'package:food_ordering2/ui/shared/custom_widgets/custom_dropdownbutton.dart';
// import 'package:food_ordering2/ui/shared/custom_widgets/custom_text.dart';
// import 'package:food_ordering2/ui/shared/custom_widgets/custom_text_field.dart';
// import 'package:food_ordering2/ui/shared/custom_widgets/custom_toast.dart';
// import 'package:food_ordering2/ui/views/login_view/login_view.dart';

// class HomeView extends StatefulWidget {
//   final Function onPressed;

//   HomeView({Key? key, required this.onPressed}) : super(key: key);


//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
// TextEditingController searchController = TextEditingController();


//   List<CategoryModel> categoryList = [];
//   List<MealModel> mealList = [];
//   @override
//   Widget build(BuildContext context) {
//   final size=MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//           drawer: Container(
//             color: AppColors.mainOrangeColor,
//           ),
//           //future is widget in flutter so we must use in body, and futureBuilder inside
//           // we putted function. here we praper connecton for api by FutureBuilder
//           body: FutureBuilder<List<dynamic>>(
//               future: Future.wait([
//                 CategoryRepository().getall(),
//                 MealRepository().getAll(),
//               ]),
//               //snapshot is wrap all data and give status of connection for example (active,done,waiting)
//               builder: ((context, AsyncSnapshot<List<dynamic>> snapshot1) {
//                 var categories = snapshot1.data != null
//                     ? snapshot1.data![0]
//                         as dartz.Either<String, List<CategoryModel>>
//                     : null;
//                 var meals = snapshot1.data != null
//                     ? snapshot1.data![1]
//                         as dartz.Either<String, List<MealModel>>
//                     : null;

//                 if (snapshot1.connectionState != ConnectionState.waiting) {
//                   categories!.fold((l) {
//                     CoustomToast.showMessage(
                        
//                         message: l,
//                         messageType: MessageType.REJECTED);
//                   }, (r) {
//                     categoryList.clear();
//                     categoryList.addAll(r);
//                   });

//                   meals!.fold((l) {
//                     CoustomToast.showMessage(
                        
//                         message: l,
//                         messageType: MessageType.REJECTED);
//                   }, (r) {
//                     //clear for not dublicat for item
//                     mealList.clear();
//                     mealList.addAll(r);
//                   });
//                 }
//                 return Container( 
//                   child: Padding(
//                     padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
//                     child: Column(
//                       children: [
//                         SizedBox(width: size.width*0.03, height: size.height*0.03),
                  
//                         Row(
//                           children: [
//                           CustomText(text: 'Good morning Akila!', textSize: size.width*0.05, ),
//                           Padding(
//                             padding:  EdgeInsets.only(left: size.width*0.38),
//                             child: Icon(Icons.shopping_cart),
//                           ),
//                         ],),
//                         CustomDropdownButton(labelTeaxt: 'dd', dropdownValue: 'dd',),

//                         SizedBox(width: size.width*0.02, height: size.height*0.02),
//                         CustomTextField(hintText: 'Search food', controller: searchController,
//                            prifText:Icon(Icons.search,), validation: (value) {  },),
//                         SizedBox(width: size.width*0.02, height: size.height*0.02),
//                         //DropdownButtonFormField(items: itel1, onChanged: onChanged)
                        
//                         categories == null
//                             ? SpinKitCircle(
//                                 color: AppColors.mainOrangeColor,
//                               )
//                               //expanded for any data comming from api and i do not know data size but it is create problems with scroll
//                             : Expanded(
//                                 child: ListView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   //shrinkrap for listView takes size according elements inside
//                                   shrinkWrap: true,
//                                   itemCount: categoryList.length,
//                                   itemBuilder: (BuildContext context, int index) {
//                                     return Column(
//                                       children: [
//                                            Container(
//                                              child: Padding(
//                                                padding: EdgeInsets.only(left: size.width*0.03),
//                                                child: CachedNetworkImage(
//                                                 imageUrl:
//                                                     'http://via.placeholder.com/120x120',
//                                                 placeholder: (context, url) =>
//                                                     CircularProgressIndicator(),
//                                                 errorWidget: (context, url, error) =>
//                                                     Icon(Icons.error),
//                                                                                        ),
//                                              ),
//                                            ),
                                        
//                                         Text(
//                                           categoryList[index].name ?? '',
//                                           style: TextStyle(fontSize: 50),
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 ),
//                               ),
//                               Row(
//                           children: [
//                           CustomText(text: 'Popular Restaurants', textSize: size.width*0.05,  ),
//                           Padding(
//                             padding:  EdgeInsets.only(left: size.width*0.38),
//                             child: 
//                           CustomText(text: 'View all', textSize: size.width*0.03,
//                              textColor: AppColors.mainOrangeColor, textFontWeight: FontWeight.bold ),
//                           ),
//                         ],),
//                         SizedBox(width: size.width*0.01, height: size.height*0.01),

//                         meals == null
//                             ? SpinKitCircle(
//                                 color: AppColors.mainOrangeColor,
//                               )
//                             : Expanded(
//                                 child: ListView.builder(
//                                   scrollDirection: Axis.vertical,
//                                   shrinkWrap: true,
//                                   itemCount: mealList.length,
//                                   itemBuilder: (BuildContext context, int index) {
//                                     return Column(
//                                       children: [
//                                         CachedNetworkImage(
//                                           imageUrl:
//                                               'http://via.placeholder.com/350x150',
//                                           placeholder: (context, url) =>
//                                               CircularProgressIndicator(),
//                                           errorWidget: (context, url, error) =>
//                                               Icon(Icons.error),
//                                         ),
//                                         Text(
//                                           mealList[index].name ?? '',
//                                           style: TextStyle(fontSize: 50),
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 ),
//                               ),
//                       ],
//                     ),
//                   ),
//                 );
//               }))),
//     );
//   }