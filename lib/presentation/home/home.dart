import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/controller/cubit/app_states.dart';
import 'package:tasks/data/model/test_model.dart';
import 'package:tasks/presentation/home/items.dart';
import '../../constants/styles.dart';
import '../../controller/cubit/app_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TestModel>? hotels;
  @override
  void initState() {
    hotels = BlocProvider.of<AppCubit>(context).getAllHotels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(Styles.appPadding),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const Header(),
                BlocBuilder<AppCubit, AppStates>(
                  builder: (context, state) {
                    if (state is SuccessDataState) {
                      hotels = (state).testModel;
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CustomCardItem(
                            name: hotels![index].name!,
                            stars: hotels![index].starts!,
                            price: hotels![index].price!,
                            image: hotels![index].image!,
                            reviewScore: hotels![index].reviewScore!,
                            review: hotels![index].review!,
                            address: hotels![index].address!,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: hotels!.length,
                      );
                    }
                    if (state is FailedDataState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const Center(
                        child: Text("Oops Some thing wrong....!"),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
