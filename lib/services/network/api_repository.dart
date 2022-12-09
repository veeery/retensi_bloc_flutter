import 'package:dio/dio.dart';
import 'package:retensi_bloc/model/users_model.dart';
import 'package:retensi_bloc/services/network/app_dio.dart';

class ApiRepository {
  static final String baseUrl = AppDio.baseUrl;

  //Login
  Future<UsersModel?> login({required String username, required String password}) async {
    late UsersModel usersModel;

    bool apiResult = await AppDio.executeApiWithTryCatch(() async {
      Response response = await AppDio.dio().post("auth/login",
          data: {
            "username": username,
            "password": password,
          },
          options: AppDio.headers
      );

      usersModel = UsersModel.fromJson(response.data);
    });

    if (apiResult) return usersModel;

    return null;
  }
}
