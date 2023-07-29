
import 'package:food_ordering2/core/data/network/network_config.dart';

class UserEndspoints {
  static String login = NetworkConfig.getFullApiUrl('user/login');
  static String register = NetworkConfig.getFullApiUrl('User/Register');

}
