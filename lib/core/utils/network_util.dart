//this file for collect full URL and dealing with any api type

import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:food_ordering2/core/enums/request_type.dart';
//as http for ensure port
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class NetworkUtil {
  static String baseUrl = 'training.owner-tech.com';
  //for making http requsets
  static var client = http.Client();


  static Future<dynamic> sendRequest({
    required RequestType type,
    required String url,
    //dealing according with api
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  })// async : case type future
   async {
    try{
    //for build all url
    var uri = Uri.https(baseUrl, url, params);
    //difine object from http for save value response 
    late http.Response response;
   // int statusCode = -1;
    //for first change utlf8 to decode
   // String strResponse = '';
    //to save statusCode and Response inside JesonResponse
    Map<String, dynamic> jsonRespons = {};

    switch (type) {
        case RequestType.GET:
          response = await client.get(uri, headers: headers);
          break;
        case RequestType.POST:
          response =
          await client.post(uri, headers: headers, body: jsonEncode(body));//encode formated for api
          break;
        case RequestType.PUT:
          response =
          await client.put(uri, headers: headers, body: jsonEncode(body));
          break;
        case RequestType.DELETE:
          response = await client.delete(uri,
              headers: headers, body: jsonEncode(body));
          break;
        case RequestType.MULTIPART:
          break;
      }
      //for problem if back enf response not jsone
      dynamic result;
      try {
        result = jsonDecode(utf8.decode(response.bodyBytes));
      } catch (e) {}

      jsonRespons.putIfAbsent('statusCode', () => response.statusCode);
      jsonRespons.putIfAbsent(
          'response',
              () => result != null
              ? result
              : {'title': utf8.decode(response.bodyBytes)});

      return jsonRespons;
    } catch (e) {
      print(e);
      BotToast.showText(text: e.toString());
    }
  }
  //for load photos in server
  static Future<dynamic> sendMultipartRequest({
    required String url,
    required RequestType type,
    Map<String, String>? headers = const {},
    //feilds are first name , last name, email.....
    Map<String, String>? fields = const {},
    //files is content key and value. key agreement between client and developer
    //files are all of file (photo and any file...)
    Map<String, String>? files = const {},
    Map<String, dynamic>? params,
  }) async {
    try {
      var request = http.MultipartRequest(type.name, Uri.https(baseUrl, url, params));

      var _filesKeyList = files!.keys.toList();

      var _filesNameList = files.values.toList();

      for (int i = 0; i < _filesKeyList.length; i++) {
        if (_filesNameList[i].isNotEmpty) {
          var multipartFile = http.MultipartFile.fromPath(
            _filesKeyList[i],
            _filesNameList[i],
            // as path for basename
            filename: path.basename(_filesNameList[i]),
           // contentType: getContentType(_filesNameList[i]),
           //mimi package
           contentType: MediaType.parse(lookupMimeType(_filesNameList[i]) ?? ''),
          );
          request.files.add(await multipartFile);
        }
      }
      request.headers.addAll(headers!);
      request.fields.addAll(fields!);

      var response = await request.send();

      Map<String, dynamic> responseJson = {};
      var value;
      try {
        value = await response.stream.bytesToString();
      } catch (e) {
        print(e);
      }

      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent('response', () => jsonDecode(value));

      return responseJson;
    } catch (error) {
      print(error.toString());
    }
  }

  static MediaType getContentType(String name) {
    var ext = name.split('.').last;
    //must ask back end for extention for example (png,jpeg ....)
    if (ext == "png" || ext == "jpeg") {
      return MediaType.parse("image/jpg");
    } else if (ext == 'pdf') {
      return MediaType.parse("application/pdf");
    } else {
      return MediaType.parse("image/jpg");
    }
  }
}
    
//      statusCode = response.statusCode;
//       strResponse = utf8.decode(response.bodyBytes);
// //putifabsent to add value insude Map
//       jsonRespons.putIfAbsent('statusCode', () => statusCode);
//       jsonRespons.putIfAbsent('response', () => jsonDecode(strResponse));

//       return jsonRespons;
//     } catch (e) {
//       print(e);
//     }
   