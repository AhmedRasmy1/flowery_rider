import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/core/resources/style_manager.dart';
import 'package:flowery_rider/features/home/presentation/widgets/skeleton_home.dart';
import 'package:flowery_rider/features/orders/domain/entities/my_orders_entity.dart';
import 'package:flowery_rider/features/orders/presentation/manager/my_orders_view_model.dart';
import 'package:flowery_rider/features/orders/presentation/widgets/my_orders_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../data/models/my_orders_response.dart';
import '../manager/my_orders_state.dart';
import '../widgets/my_order_details_view.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  late MyOrdersViewModel viewModel;
  late String savedToken;
  late List<Orders> ordersViewed;
  int completedOrders = 0;
  int cancelledOrders = 0;

  @override
  void initState() {
    savedToken = CacheService.getData(key: CacheConstants.userToken) ?? '';
    viewModel = getIt<MyOrdersViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: ColorManager.white,
      color: ColorManager.pink,
      onRefresh: () {
        return viewModel.getMyOrders("Bearer $savedToken");
      },
      child: BlocProvider(
        create: (context) => viewModel..getMyOrders("Bearer $savedToken"),
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 16),
                child: CustomAppBar(
                  color: Colors.black,
                  title: 'My orders',

                  // onTap: () {},
                ),
              ),
              SizedBox(
                height: 24,
              ),
              BlocBuilder<MyOrdersViewModel, MyOrdersState>(
                  builder: (context, state) {
                if (state is MyOrdersLoading) {
                  return Expanded(child: SkeletonHome());
                } else if (state is MyOrdersSuccess) {
                  MyOrdersEntity myOrdersEntity = state.myOrdersEntity;
                  List<Orders> orders = myOrdersEntity.orders ?? [];
                  print("============================");
                  print(orders.length);
                  int index = orders.length;
                  for (int i = 0; i < index; i++) {
                    if (orders[i].order?.state == 'completed') {
                      completedOrders++;
                      print("======================${completedOrders}");
                    }
                  }
                  int count = orders.length;

                  for (int j = 0; j < count; j++) {
                    if (orders[j].order?.state == 'cancelled') {
                      cancelledOrders++;
                      print("======================${cancelledOrders}");
                    }
                  }
                  return Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffF9ECF0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10) //
                                          ),
                                    ),
                                    height: 90,
                                    width: 170,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 22, top: 12),
                                          child: Text(
                                            "${cancelledOrders}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/cancelled.png',
                                                width: 24,
                                                height: 24,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                'Cancelled',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 33,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffF9ECF0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10) //
                                          ),
                                    ),
                                    height: 90,
                                    width: 170,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 22, top: 12),
                                          child: Text(
                                            "${completedOrders}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/completed.png',
                                                width: 24,
                                                height: 24,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                'Completed',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                            child: Text(
                              'Recent orders',
                              style: getSemiBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ),
                          ),
                        ),
                        SliverList.builder(
                          itemBuilder: (context, index) => Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyOrderDetailsView(
                                      orders:
                                          state.myOrdersEntity.orders![index],
                                    ),
                                  ),
                                );
                              },
                              child: MyOrderCard(
                                myOrders: orders[index],
                              ),
                            ),
                          ),
                          itemCount: state.myOrdersEntity.orders!.length,
                        )
                      ],
                    ),
                  );
                } else if (state is MyOrdersError) {
                  return const Center(child: Text('Error'));
                }
                return SizedBox();
              }),
            ],
          ),
        )),
      ),
    );
  }
}
