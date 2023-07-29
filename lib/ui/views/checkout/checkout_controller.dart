
import 'package:food_ordering2/core/services/base_controller.dart';
import 'package:food_ordering2/core/services/cart_service.dart';
import 'package:food_ordering2/ui/shared/util.dart';
import 'package:food_ordering2/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class CheckoutController extends BaseController {
  @override
  //onClose in flutter when build, will know which context here and close it. (check out)
  void onClose() {
    cartService.clearCart();
    Get.off(MainView());
    super.onClose();
  }
}