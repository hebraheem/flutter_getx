import 'package:get/get.dart';

import '../../../utils/app_constant.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    token = AppConstants.TOKEN;
    timeout = const Duration(minutes: 3);
    _mainHeaders = {
      "content-type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
    };
  }

  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
