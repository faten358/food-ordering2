import 'package:food_ordering2/ui/shared/util.dart';
import 'package:food_ordering2/ui/views/intro_view/intro_view.dart';
import 'package:food_ordering2/ui/views/landing_view/landing_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    if (storage.getOrderPlaced()) {
      cartService.clearCart();
      storage.setOrderPlaced(false);
    }
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (storage.getFirstLunch()) {
        Get.off(IntroView());
      } else {
        Get.off(storage.getIsLogedin() ? LandingView() : LandingView());
      }
      //Get.back();
      storage.setFirstLunch(false);
    });
    super.onInit();
  }
}