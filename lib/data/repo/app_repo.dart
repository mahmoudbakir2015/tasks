// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../model/test_model.dart';
import '../service/app_web_service.dart';

class AppRepo {
  AppWebService appWebService;
  AppRepo({
    required this.appWebService,
  });
  Future<List<TestModel>> getAllHotels() async {
    final hotels = await appWebService.getAllHotels();
    return hotels.map((hotel) => TestModel.fromJson(hotel)).toList();
  }
}
