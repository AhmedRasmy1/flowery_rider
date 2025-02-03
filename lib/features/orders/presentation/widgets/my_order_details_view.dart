import 'package:flowery_rider/core/di/di.dart';
import 'package:flowery_rider/core/firebase_core/firebase_utils/firebase_utils.dart';
import 'package:flowery_rider/core/utils/cashed_data_shared_preferences.dart';
import 'package:flowery_rider/features/order_details/presentation/widgets/order_delivered_successfully.dart';
import 'package:flowery_rider/features/order_details/presentation/widgets/skeleton_order_details.dart';
import 'package:flowery_rider/features/orders/presentation/widgets/my_orders_details_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../data/models/my_orders_response.dart';

class MyOrderDetailsView extends StatefulWidget {
  const MyOrderDetailsView({
    required this.orders,
    super.key,
  });

  final Orders orders;

  @override
  State<MyOrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<MyOrderDetailsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.greyTooLight,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CustomAppBar(
                title: 'Order Details',
                onTap: () {},
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: MyOrderDetailsViewBody(
                orders: widget.orders,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
