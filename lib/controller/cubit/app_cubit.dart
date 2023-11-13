import 'package:flutter/material.dart';
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

  changeSort({required int choose, required BuildContext context}) {
    switch (choose) {
      case 0:
        BlocProvider.of<AppCubit>(context).hotels!.shuffle();
        emit(SuccessDataState(
          testModel: BlocProvider.of<AppCubit>(context).hotels!,
        ));
        break;
      case 1:
        BlocProvider.of<AppCubit>(context).hotels!.shuffle();
        emit(SuccessDataState(
          testModel: BlocProvider.of<AppCubit>(context).hotels!,
        ));

        break;
      case 2:
        BlocProvider.of<AppCubit>(context).hotels!.shuffle();
        emit(SuccessDataState(
          testModel: BlocProvider.of<AppCubit>(context).hotels!,
        ));

        break;
      case 3:
        BlocProvider.of<AppCubit>(context).hotels!.shuffle();
        emit(SuccessDataState(
          testModel: BlocProvider.of<AppCubit>(context).hotels!,
        ));

        break;
      case 4:
        BlocProvider.of<AppCubit>(context)
            .hotels
            ?.sort((a, b) => a.reviewScore.compareTo(b.reviewScore));
        emit(SuccessDataState(
          testModel: BlocProvider.of<AppCubit>(context).hotels!,
        ));

        break;
      case 5:
        BlocProvider.of<AppCubit>(context)
            .hotels
            ?.sort((a, b) => a.price.compareTo(b.price));
        emit(SuccessDataState(
          testModel: BlocProvider.of<AppCubit>(context).hotels!,
        ));

        break;
      case 6:
        BlocProvider.of<AppCubit>(context).hotels!.shuffle();
        emit(SuccessDataState(
          testModel: BlocProvider.of<AppCubit>(context).hotels!,
        ));

        break;
    }
  }
}
