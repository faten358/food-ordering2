
import 'package:bot_toast/bot_toast.dart';
import 'package:food_ordering2/core/enums/operation_type.dart';
import 'package:food_ordering2/core/enums/request_status.dart';
import 'package:food_ordering2/ui/shared/util.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  Rx<RequestStatus> requestStatus = RequestStatus.DEFAULT.obs;
  Rx<OperationType> operationType = OperationType.NONE.obs;
  RxList<OperationType> listType = <OperationType>[].obs;

  Future runFutureFunction({required Future function}) async {
    return await function;
  }

  Future runLoadingFutureFunction(
      {required Future function,
        OperationType? type = OperationType.NONE}) async {
      // here we putted loading becouse we wait responce from api -
      // and seconde line we putted type we specify type in controller (example category or meal)
    requestStatus.value = RequestStatus.LOADING;
    operationType.value = type!;
    listType.add(type);
    //putted await becouse any error will apper or week connecting (internet)
    await function;
    //here api responsed and return status and type for defulte
   requestStatus.value = RequestStatus.DEFAULT;
    operationType.value = OperationType.NONE;
  }

  //for lock screen 
Future runFullLoadingFutureFunction({
  required Future function,
}) async {
  customLoader();
  await function;
  BotToast.closeAllLoading();
}

}