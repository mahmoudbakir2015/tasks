import 'package:dio/dio.dart';

import '../../constants/endpoints.dart';
import '../../core/utils/api_service.dart';

class AppWebService {
  Future<List<dynamic>> getAllHotels() async {
    try {
      Response response = await DioHelper.getData(
        endPoint: EndPoints.hotels,
      );
      print(response.data[0]['name']);
      return response.data;
    } catch (e) {
      print("${e.toString()} ");
    }

    return [];
  }
}
