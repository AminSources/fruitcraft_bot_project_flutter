import 'package:dio/dio.dart';
import 'package:fruitcraft_bot_project/core/params/fruit_account_params.dart';

class UserApiProvider {
  Dio dio = Dio();

  //? profile method
  Future<dynamic> profile(String token) async {
    //? send get request to profile endpoint
    Response response = await dio.get(
      "http://192.168.1.101:5000/api/profile",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    //? return response
    return response;
  }

  //? add fruit account method
  Future<dynamic> addFruitAccount(FruitAccountParams fruitAccountParams) async {
    //? send post request to add fruit account endpoint
    Response response = await dio.post(
      "http://192.168.1.101:5000/api/fruit_account/add",
      data: {
        "name": fruitAccountParams.name,
        "restore_key": fruitAccountParams.restoreKey,
        "license_key": fruitAccountParams.licenseKey,
      },
      options: Options(
        headers: {"Authorization": "Bearer ${fruitAccountParams.token}"},
      ),
    );

    //? return response
    return response;
  }
}
