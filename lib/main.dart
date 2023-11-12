import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/controller/cubit/app_cubit.dart';
import 'package:tasks/core/bloc_observer.dart';
import 'package:tasks/core/utils/api_service.dart';
import 'package:tasks/data/repo/app_repo.dart';
import 'package:tasks/data/service/app_web_service.dart';
import 'package:tasks/presentation/home/home.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) =>
            AppCubit(appRepo: AppRepo(appWebService: AppWebService())),
        child: const Home(),
      ),
    );
  }
}
