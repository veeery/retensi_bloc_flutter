// ignore_for_file: avoid_print, unnecessary_overrides
import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    String? message;

    switch (err.type) {
      case DioErrorType.connectTimeout:
        message = "Connection Time Out";
        break;
      case DioErrorType.other:
        message = "No Internet";
        break;
      case DioErrorType.response:
        switch (err.response!.statusCode) {
          case 400:
            message = "Invalid Request";
            break;
          case 401:
            message = "Access denied";
            break;
          case 404:
            message = "The Requested could not be found";
            break;
          case 409:
            message = "Conflict occurred";
            break;
          case 500:
            message = "Unknown error occurred, please try again later";
            break;
        }
        break;
      default:
        message = err.message.toString();
        break;
    }
    //TODO return Message Error Snackbar in Here
    super.onError(err, handler);
  }
}