import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering2/core/data/repositories/shared_preferance_repository.dart';
import 'package:food_ordering2/core/services/cart_service.dart';
import 'package:food_ordering2/core/services/location_service.dart';
import 'package:food_ordering2/ui/shared/util.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/my_app.dart';
import 'firebase_options.dart';

//at the complate project level
//SharedPreferences? globalsharedPrefs;
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //i removed global shared becouse set dependency enjuction
 // globalsharedPrefs = await SharedPreferences.getInstance();

 //for dependency Enjuction
await Get.putAsync(() async {
  //sharedPreferance from flutter package
    var sharedPref = await SharedPreferences.getInstance();
    return sharedPref;
});

Get.put(SharedPreferanceRepositories());
Get.put(CartService());
Get.put(LocationService());


//for firebase
try{
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
final fcmToken = await FirebaseMessaging.instance.getToken();
print(fcmToken);
//here call to api from back end

FirebaseMessaging.instance.onTokenRefresh
    .listen((fcmToken) {
      // TODO: If necessary send token to application server.

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    })
    .onError((err) {
      // Error getting token.
    });

 if(GetPlatform.isIOS)   {
FirebaseMessaging messaging = FirebaseMessaging.instance;

NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  //important for notification when screen lock
  provisional: true,
  sound: true,
);

print('User granted permission: ${settings.authorizationStatus}');}

}catch (e){
  print(e);
   }

  runApp(const MyApp());
}