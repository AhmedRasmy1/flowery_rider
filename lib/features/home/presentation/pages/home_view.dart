import 'package:flowery_rider/core/resources/style_manager.dart';
import 'package:flowery_rider/core/resources/values_manager.dart';
import 'package:flowery_rider/core/widgets/custom_app_bar.dart';
import 'package:flowery_rider/features/home/data/response/pending__orders__response.dart';
import 'package:flowery_rider/features/home/presentation/widgets/available_for_delivery.dart';
import 'package:flowery_rider/features/home/presentation/widgets/refresh_home.dart';
import 'package:flowery_rider/features/home/presentation/widgets/skeleton_home.dart';
import '../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late List<Orders> ordersViewed;
  bool isRefreshIndicator = true;
  bool isAvailable = true;

  @override
  void initState() {
    savedToken = CacheService.getData(key: CacheConstants.userToken) ?? '';
    viewModel = getIt<HomeCubit>();

    super.initState();
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.white,
      displacement: 0,
      color: ColorManager.pink,
      onRefresh: () {
        isRefreshIndicator = false;
        return viewModel.getHomeData("Bearer $savedToken");
      },
      child: BlocProvider(
        create: (context) => viewModel..getHomeData("Bearer $savedToken"),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                CustomAppBarHome(
                  title: 'Flowery Rider',
                  color: ColorManager.pink,
                  isAvailable: isAvailable,
                  onChanged: (value) {
                    setState(() {
                      isAvailable = value;
                    });
                  },
                ),
                isAvailable
                    ? BlocConsumer<HomeCubit, HomeState>(
                        listener: (context, state) {
                        if (state is HomeSuccess) {
                          isRefreshIndicator = true;
                        }
                      }, builder: (context, state) {
                        if (state is HomeLoading) {
                          return Expanded(child: SkeletonHome());
                        } else if (state is HomeSuccess) {
                          PendingDriverOrdersEntity pendingDriverOrdersEntity =
                              state.pendingDriverOrdersEntity;
                          List<Orders> orders =
                              pendingDriverOrdersEntity.orders ?? [];

                          return orders.isNotEmpty
                              ? Expanded(
                                  child: Stack(
                                    clipBehavior: Clip.antiAlias,
                                    children: [
                                      ListView.builder(
                                        padding: EdgeInsets.all(16.0),
                                        itemCount: orders.length,
                                        itemBuilder: (context, index) {
                                          return OrderCard(
                                            orderPending: orders[index],
                                            onReject: () {
                                              viewModel.rejectOrderFromScreen(
                                                  orders[index]);
                                            },
                                          );
                                        },
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 25,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorManager.pink
                                                .withOpacity(.6),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          child: Text(
                                            orders.length.toString(),
                                            style: getBoldStyle(
                                                color: ColorManager.white,
                                                fontSize: AppSize.s14),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Expanded(
                                  child: RefreshHome(
                                      viewModel: viewModel,
                                      savedToken: savedToken),
                                );
                        } else {
                          return const Center(child: Text('Error'));
                        }
                      })
                    : Expanded(child: AvailableForDelivery()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
