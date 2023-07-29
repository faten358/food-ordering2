import 'package:food_ordering2/core/data/models/apis/category_model.dart';
import 'package:food_ordering2/core/data/models/apis/meal_model.dart';
import 'package:food_ordering2/core/data/repositories/category_repositories.dart';
import 'package:food_ordering2/core/data/repositories/meal_repositories.dart';
import 'package:food_ordering2/core/enums/operation_type.dart';
import 'package:food_ordering2/core/enums/message_file.dart';
import 'package:food_ordering2/core/enums/request_status.dart';
import 'package:food_ordering2/core/services/base_controller.dart';
import 'package:food_ordering2/core/services/cart_service.dart';
import 'package:food_ordering2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:food_ordering2/ui/shared/util.dart';
import 'package:get/get.dart';


class HomeController extends BaseController {

  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<MealModel> mealList = <MealModel>[].obs;

  bool get isCategoryLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          listType.contains(OperationType.CATEGORY);

  bool get isMealLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          listType.contains(OperationType.MEAL);


  @override
  void onInit() {
    getAllCategory();
    getAllMeal();
    super.onInit();
  }

  void getAllCategory() {
    runLoadingFutureFunction(
        type: OperationType.CATEGORY,
        function: CategoryRepository().getall().then((value) {
          value.fold((l) {
            CoustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            categoryList.addAll(r);
          });
        }));
  }
  void getAllMeal() {
    runLoadingFutureFunction(
        type: OperationType.MEAL,
        function: MealRepository().getAll().then((value) {
          value.fold((l) {
            CoustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            mealList.addAll(r);
          });
        }));
  }

  void addToCart(MealModel model) {
    cartService.addToCart(
        model: model,
        count: 1,
        afterAdd: () {
          CoustomToast.showMessage(
              message: 'Added', messageType: MessageType.SUCCESS);
        });
  }

}