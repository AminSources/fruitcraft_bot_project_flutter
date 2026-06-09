import 'package:dio/dio.dart';
import 'package:fruitcraft_bot_project/core/params/fruitbot_params.dart';

class FruitbotApiProvider {
  Dio dio = Dio();

  Future<dynamic> loadPlayerInfo(LoadPlayerParams loadPlayerParams) async {
    //? send get request to load player endpoint
    Response response = await dio.get(
      "http://192.168.1.101:5000/api/bot/load",
      data: {"restore_key": loadPlayerParams.restoreKey},
      options: Options(
        headers: {"Authorization": "Bearer ${loadPlayerParams.token}"},
      ),
    );

    //? return response
    return response;
  }
}
