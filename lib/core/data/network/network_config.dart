import 'package:food_ordering2/core/enums/request_type.dart';
import 'package:food_ordering2/ui/shared/util.dart';

//for file setting any request from api

class NetworkConfig {
  //the same shared preferance
  //important for virgen
  static String BASE_API = 'api/web/';
  // fun return srting 
  static String getFullApiUrl(String api) {
    return BASE_API + api;
  }
  // header same all of request in general
static Map<String, String> getHeaders(
      {bool? needAuth = true,
      RequestType? type = RequestType.POST,
      Map<String, String>? extraHeaders = const {}}) {
    return {
      if (needAuth!)
        'Authorization':
            'Bearer ${storage.getTokenInfo()?.accessToken ?? ''}',
      if (type != RequestType.GET) 'Content-Type': 'application/json',
      ...extraHeaders!
    };
  }
}




