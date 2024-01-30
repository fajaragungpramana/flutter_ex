import 'package:get/get_connect/connect.dart';

class AppRemoteService extends GetConnect {

  @override
  void onInit() {
    httpClient.baseUrl = "http://192.168.0.141:8080/api/";
    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addAuthenticator<Object?>((request) {
      request.headers["Authorization"] = "Bearer ";
      return request;
    });

    super.onInit();
  }

}