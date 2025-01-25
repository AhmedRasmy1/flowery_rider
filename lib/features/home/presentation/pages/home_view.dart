import 'package:flowery_rider/core/widgets/custom_app_bar.dart';
import 'package:flowery_rider/features/home/presentation/widgets/skeleton_home.dart';
import 'package:flowery_rider/features/order_details/presentation/widgets/firebase_functions.dart';

import '../../../../core/resources/color_manager.dart';
import '../../data/response/driver_orders_response.dart';
import '../../domain/home_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../domain/pending_entity.dart';
import '../view_model/home_state.dart';
import '../view_model/home_view_model.dart';
import '../widgets/order_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit viewModel;
  late String savedToken;

  @override
  void initState() {
    savedToken = CacheService.getData(key: CacheConstants.userToken) ?? '';
    viewModel = getIt<HomeCubit>();
    viewModel.getHomeData("Bearer $savedToken");
    super.initState();
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => viewModel,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAppBar(
                    title: 'Flowery Rider',
                    color: ColorManager.pink,
                  ),
                  Switch(
                    activeTrackColor: Colors.green,
                    value: true,
                    onChanged: (value) {},
                    activeColor: ColorManager.white,
                    inactiveThumbColor: Colors.green,
                  ),
                ],
              ),
              BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return Expanded(child: SkeletonHome());
                    } else if (state is HomeSuccess) {
                      PendingDriverOrdersEntity pendingDriverOrdersEntity =
                          state.pendingDriverOrdersEntity;
                      var orders = pendingDriverOrdersEntity.orders;
                      return Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.all(16.0),
                          itemCount: orders?.length,
                          itemBuilder: (context, index) {
                            return OrderCard(orders![index]);
                          },
                        ),
                      );
                    } else {
                      return const Center(child: Text('Error'));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
