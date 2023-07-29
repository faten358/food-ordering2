import 'package:dartz/dartz.dart';
import 'package:food_ordering2/core/data/models/apis/category_model.dart';
//import 'package:food_ordering2/core/data/models/apis/token_info.dart';
import 'package:food_ordering2/core/data/models/common_response.dart';
import 'package:food_ordering2/core/data/network/endpoints/category_endpoints.dart';
//import 'package:food_ordering2/core/data/network/endpoints/user_endpoints.dart';
import 'package:food_ordering2/core/data/network/network_config.dart';
import 'package:food_ordering2/core/enums/request_type.dart';
import 'package:food_ordering2/core/utils/network_util.dart';

class CategoryRepository {
  //either return left and right and must include package dartz
  Future<Either<String, List< CategoryModel>>> getall()
    
   async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: CategoryEndpoints.getall,
        headers: NetworkConfig.getHeaders(needAuth: false),
        //.then for enshure return response
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<CategoryModel> result= [];
          commonResponse.data!.forEach(
            (element) {
              result.add(CategoryModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }}

//   Future<Either<String, TokenInfo>> register({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//         type: RequestType.POST,
//         url: UserEndspoints.login,
//         body: {
//           'userName': email,
//           'password': password,
//         },
//         headers: NetworkConfig.getHeaders(needAuth: false),
//       ).then((response) {
//         CommonResponse<Map<String, dynamic>> commonResponse =
//             CommonResponse.fromJson(response);

//         if (commonResponse.getStatus) {
//           return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
//         } else {
//           return Left(commonResponse.message ?? '');
//         }
//       });
//     } catch (e) {
//       BotToast.showText(text: e.toString());
//       return Left(e.toString());
//     }
//   }
// }