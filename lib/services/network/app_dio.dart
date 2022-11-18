
import 'package:dio/dio.dart';
import 'package:retensi_bloc/services/network/interceptor.dart';

class AppDio {

  static String baseUrl = "http://192.168.88.30:3000/";
  final appDio = dio();

  static Options headers = Options(
      headers: {
        Headers.contentTypeHeader: "application/x-www-form-urlencoded",
        Headers.acceptHeader: "application/json",
      }
  );

  static Options headersToken() {
    return Options(
        headers: {
          //"Authorization": "Bearer ${UserController.to.user.token}",
          Headers.contentTypeHeader: "application/x-www-form-urlencoded",
          Headers.acceptHeader: "application/json",
        }
    );
  }

  static Future<bool> executeApiWithTryCatch(Function function) async {
    try{
      //Success Load API
      await function();
      return true;
    } on DioError catch (e) {
      //Failed Load API
      print(e.toString());
      return false;
    }
  }

  static Dio dio() {
    final options = BaseOptions(
        baseUrl: "$baseUrl/api/",
        // baseUrl: "$baseUrl/",
        contentType: "application/json",
        connectTimeout: 30000,
        sendTimeout: 30000,
        receiveTimeout: 30000,
        responseType: ResponseType.json
    );

    var dio = Dio(options);
    dio.interceptors.add(AppInterceptor());


    return dio;
  }

}