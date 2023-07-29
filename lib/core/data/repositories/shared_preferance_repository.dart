import 'dart:convert';

import 'package:food_ordering2/core/data/models/apis/token_info.dart';
import 'package:food_ordering2/core/data/models/cart_model.dart';
import 'package:food_ordering2/core/enums/date_type.dart';
import 'package:food_ordering2/main.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/app_config.dart';

class SharedPreferanceRepositories {
  //for dependency Enjection
  SharedPreferences globalsharedPrefs= Get.find();

   String PREF_FIRST_LUNOUCH = 'FIRST_LUNCH';
   String PREF_IS_LOGEDIN = 'is_logedin';
   String PREF_TOKEN_INFO = 'token_info';
  //for multi languages
   String PREF_APP_LANG = 'app_language';
   //for cart model
   String PREF_CART_LIST = 'cart_list';
   //for any close application if frome home button or nav or any place
   String PREF_ORDER_PLACED = 'order_placed';

    setOrderPlaced(bool value) {
    setPreferance(
      dataType: DataType.BOOL,
      key: PREF_ORDER_PLACED,
      value: value,
    );
  }

  bool getOrderPlaced() {
    if (globalsharedPrefs.containsKey(PREF_ORDER_PLACED)) {
      return getpreferance(key: PREF_ORDER_PLACED);
    } else {
      return false;
    }
  }

  void setCartList(List<CartModel> list) {
    setPreferance(
        dataType: DataType.STRING,
        key: PREF_CART_LIST,
        value: CartModel.encode(list));
  }

  List<CartModel> getCartList() {
    if (globalsharedPrefs.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getpreferance(key: PREF_CART_LIST));
    } else {
      return [];
    }
  }
 setTokenInfo(TokenInfo value) {
    setPreferance(
      dataType: DataType.STRING,
      key: PREF_TOKEN_INFO,
      value: jsonEncode(value),
    );
  }

   TokenInfo? getTokenInfo() {
    if (globalsharedPrefs.containsKey(PREF_TOKEN_INFO)) {
      return TokenInfo.fromJson(jsonDecode(getpreferance(key: PREF_TOKEN_INFO)));
    } else {
      return null;
    }
  }

       setAppLanguage(String value) {
        setPreferance(
          dataType: DataType.STRING,
          key: PREF_APP_LANG,
          value: value,
      );
    }

     String getAppLanguage() {
        if (globalsharedPrefs.containsKey(PREF_APP_LANG)) {
          return getpreferance(key: PREF_APP_LANG);
        } else {
          //if user does not select any language so by defulte the same like here (example 'ar')
          return AppConfig.defultLanguage;
      }
    }

    setFirstLunch(bool value){
      setPreferance(
        dataType: DataType.BOOL,
        //for test value if user open app in first one or onther one 
        key: PREF_FIRST_LUNOUCH,
         value: value, );
   }

       setIsLogedin(bool value){
      setPreferance(
        dataType: DataType.BOOL,
        //for test value if user open app in first one or onther one 
        key: PREF_IS_LOGEDIN,
         value: value, );
   }

   bool getFirstLunch(){
    //containsKey for test globalSharedPref if empty value or fill and get it true this mean the first entery
    if(globalsharedPrefs.containsKey(PREF_FIRST_LUNOUCH)){
      return getpreferance(key: PREF_FIRST_LUNOUCH);

    }else {return true;}
  }

    bool getIsLogedin(){
    //containsKey for test globalSharedPref if empty value or fill and get it true this mean the first entery
    if(globalsharedPrefs.containsKey(PREF_IS_LOGEDIN)){
      return getpreferance(key: PREF_IS_LOGEDIN);

    }else {return false;}
  }
  
   setPreferance({required DataType dataType, required String key, required dynamic value}) async{
    switch(dataType){
      
      case DataType.INT:
      await globalsharedPrefs.setInt(key, value);
        break;
      case DataType.BOOL:
      await globalsharedPrefs.setBool(key, value);
        break;
      case DataType.STRING:
      await globalsharedPrefs.setString(key, value);
        break;
      case DataType.DOUBLE:
      await globalsharedPrefs.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
      await globalsharedPrefs.setStringList(key, value);
        break;
    }
  }
  //for give value of globalKeyPref only!
   dynamic getpreferance({required String key}){
    return globalsharedPrefs.get(key);
  }
}