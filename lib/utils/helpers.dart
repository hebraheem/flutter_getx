import 'app_constant.dart';

class Utils {
  static buildImagePath<String>(String path) {
    return "${AppConstants.ROOT_URL}/uploads/$path";
  }
}
