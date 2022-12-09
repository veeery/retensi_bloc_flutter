
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retensi_bloc/pages/navigator_key.dart';
import 'package:retensi_bloc/services/network/app_dio.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Request Url : ${AppDio.baseUrl}${options.path}');

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
        message = err.response!.data['message'].toString();
        break;
    }
    //TODO return Message Error Snackbar in Here
    print(message);

    scaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text(err.response!.data['message'].toString()))
    );

    super.onError(err, handler);
  }
}
