import 'package:food_ordering2/core/data/models/apis/meal_model.dart';
import 'package:food_ordering2/core/services/base_controller.dart';
import 'package:food_ordering2/core/services/cart_service.dart';
import 'package:food_ordering2/ui/shared/util.dart';
import 'package:food_ordering2/ui/views/cart_view/cart_view.dart';
import 'package:get/get.dart';


class MealDetailsController extends BaseController {
  MealDetailsController(MealModel mealModel) {
    model = mealModel;
  }

  MealModel model = MealModel();
  RxInt count = 1.obs;

  
  void changeCount(bool increase) {
    if (increase)
      count++;
    else {
      if (count > 1) count--;
    }
  }

 double calcTotal() {
    return (count.value * model.price!).toDouble();
  }
  
  void addToCart() {
    cartService.addToCart(
        model: model,
        count: count.value,
        afterAdd: () {
          Get.to(() => CartView());
        });
  }
}
