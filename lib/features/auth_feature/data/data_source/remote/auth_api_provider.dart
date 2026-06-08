import 'package:dio/dio.dart';
import 'package:fruitcraft_bot_project/core/params/login_params.dart';
import 'package:fruitcraft_bot_project/core/params/register_params.dart';

class AuthApiProvider {
  //* initialize dio client
  Dio dio = Dio();

  //? login method
  Future<dynamic> login(LoginParams loginParams) async {
    //? send post request to login endpoint
    Response response = await dio.post(
      "http://192.168.1.101:5000/api/login",
      data: {"email": loginParams.email, "password": loginParams.password},
    );

    //? return response
    return response;
  }

  //? register method
  Future<dynamic> register(RegisterParams registerParams) async {
    //? send post request to register endpoint
    Response response = await dio.post(
      "http://192.168.1.101:5000/api/register",
      data: {
        "name": registerParams.name,
        "email": registerParams.email,
        "password": registerParams.password,
      },
    );

    //? return response
    return response;
  }
}
