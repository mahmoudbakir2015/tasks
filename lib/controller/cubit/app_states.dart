import '../../data/model/test_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class SuccessDataState extends AppStates {
  final List<TestModel> testModel;

  SuccessDataState({required this.testModel});
}

class FailedDataState extends AppStates {
  final String errMessage;

  FailedDataState({required this.errMessage});
}

class ChangeState extends AppStates {}
