import 'package:food_ordering2/core/data/models/apis/meal_model.dart';
import 'package:food_ordering2/core/data/models/cart_model.dart';
import 'package:food_ordering2/ui/shared/util.dart';
import 'package:get/get.dart';

class CartService {
  RxList<CartModel> cartList = storage.getCartList().obs;

  RxInt cartCount = 0.obs;

  RxDouble subTotal = 0.0.obs;
  RxDouble tax = 0.0.obs;
  RxDouble delivery = 0.0.obs;
  RxDouble total = 0.0.obs;

  CartService() {
    cartCount.value = getCartCount();
    calcTotals();
  }

  void addToCart({
    required MealModel model,
    required int count,
    //afterAdd for if we putted button next meal in same context and without go to the meal deatels
    Function? afterAdd,
  }) {
    if (getCartModel(model) != null) {
      int index = cartList.indexOf(getCartModel(model)!);
      cartList[index].count = cartList[index].count! + count;
      cartList[index].total = cartList[index].total! + (count * model.price!);
    } else {
      cartList.add(CartModel(
        count: count,
        total: (count * model.price!).toDouble(),
        mealModel: model,
      ));
    }
    //for modified in count whin per add to cart
    cartCount.value += count;
    calcTotals();
    storage.setCartList(cartList);
    if (afterAdd != null) afterAdd();
  }

  void removeFromCart({required CartModel model, Function? afterRemove}) {
    cartList.remove(model);
    storage.setCartList(cartList);
    cartCount.value -= model.count!;
    calcTotals();

    if (afterRemove != null) afterRemove();
  } 

  //here increase or decrease
  void changeCount(
      {required bool incress,
        required CartModel model,
        Function? afterChange}) {
    CartModel result = getCartModel(model.mealModel!)!;
    int index = cartList.indexOf(result);

    if (incress) {
      result.count = result.count! + 1;
      result.total = result.total! + model.mealModel!.price!;
    //for modified in count whin per add to cart
      cartCount.value += 1;
    } else {
      if (result.count! > 1) {
        result.count = result.count! - 1;
        result.total = result.total! - model.mealModel!.price!;
    //for modified in count whin per remove to cart
        cartCount.value -= 1;
      }
    }

    cartList.remove(result);
    cartList.insert(index, result);

    calcTotals();

    storage.setCartList(cartList);
    if (afterChange != null) afterChange();
  }

  //for check if cart model exist or not
  CartModel? getCartModel(MealModel model) {
    try {
      return cartList.firstWhere(
            (element) => element.mealModel!.id == model.id,
      );
    } catch (e) {
      return null;
    }
  }

  //for number in bascket icon 
  int getCartCount() {
    return cartList.fold(
        0, (previousValue, element) => previousValue + element.count!);
  }

  //for modified to 4 arguments(subtotal, tax, delivery, total)
  void calcTotals() {
    subTotal.value = cartList.fold(
        0, (previousValue, element) => previousValue + element.total!);
    //taxAmount and deliveryAmount are exist in util
    tax.value = subTotal * taxAmount;
    delivery.value = (subTotal.value + tax.value) * deliveryAmount;
    total.value = subTotal.value + tax.value + delivery.value;
  }


  void clearCart() {
    cartList.clear();
    storage.setCartList(cartList);
    cartCount.value = 0;
    calcTotals();
  }
}