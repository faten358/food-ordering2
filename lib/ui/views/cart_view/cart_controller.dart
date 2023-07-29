
import 'package:food_ordering2/core/data/models/cart_model.dart';
import 'package:food_ordering2/core/services/base_controller.dart';
import 'package:food_ordering2/core/services/cart_service.dart';
import 'package:food_ordering2/ui/shared/util.dart';
import 'package:food_ordering2/ui/views/checkout/checkout_view.dart';
import 'package:get/get.dart';


class CartController extends BaseController {
  List<CartModel> get cartList => cartService.cartList;
 

  

 void removeFromCart(CartModel model) {
    cartService.removeFromCart(
      model: model,
    );
  }

   void changeCount(bool increase, CartModel model) {
    cartService.changeCount(
      incress: increase,
      model: model,
    );
  }

  void checkout() {
    runFullLoadingFutureFunction(
        function: Future.delayed(Duration(seconds: 2)).then((value) {
          //must .off becouse don't return user to cart
          Get.off(CheckoutView());
        }));
  }

}
