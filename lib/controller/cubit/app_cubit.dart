import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/controller/cubit/app_states.dart';
import '../../data/model/test_model.dart';
import '../../data/repo/app_repo.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit({required this.appRepo}) : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  final AppRepo appRepo;
  List<TestModel>? hotels;

  List<TestModel>? getAllHotels() {
    appRepo.getAllHotels().then((testModel) {
      emit(SuccessDataState(
        testModel: testModel,
      ));
      hotels = testModel;
    }).catchError((error) {
      print(error.toString());
      emit(FailedDataState(
        errMessage: error.toString(),
      ));
    });
    return hotels;
  }
}
