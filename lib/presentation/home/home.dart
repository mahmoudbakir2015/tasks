import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/controller/cubit/app_states.dart';
import 'package:tasks/presentation/home/items.dart';
import '../../constants/styles.dart';
import '../../controller/cubit/app_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).hotels =
        BlocProvider.of<AppCubit>(context).getAllHotels();
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
                    AppCubit appCubit = AppCubit.get(context);
                    if (state is SuccessDataState) {
                      appCubit.hotels = (state).testModel;
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CustomCardItem(
                            name: appCubit.hotels![index].name!,
                            stars: appCubit.hotels![index].starts!,
                            price: appCubit.hotels![index].price!,
                            image: appCubit.hotels![index].image!,
                            reviewScore: appCubit.hotels![index].reviewScore!,
                            review: appCubit.hotels![index].review!,
                            address: appCubit.hotels![index].address!,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: appCubit.hotels!.length,
                      );
                    }
                    if (state is FailedDataState) {
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text("Oops Some thing wrong or Network....!"),
                        ],
                      );
                    } else {
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text("Please wait...🥰"),
                        ],
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
