import 'app_constant.dart';

class Utils {
  static String buildImagePath(String path) {
    return "${AppConstants.ROOT_URL}/uploads/$path";
  }
}
