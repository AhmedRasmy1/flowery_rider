import 'package:flowery_rider/features/orders/presentation/widgets/pickup_info.dart';

import '../../../home/presentation/widgets/storeInfo.dart';
import 'package:flutter/material.dart';

import '../../data/models/my_orders_response.dart';

class MyOrderCard extends StatefulWidget {
  final Orders myOrders;

  const MyOrderCard({required this.myOrders, super.key});

  @override
  State<MyOrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<MyOrderCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 16.0),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Flower order",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Image.asset(
                    'assets/images/completed.png',
                  ),
                  SizedBox(width: 6),
                  Text('${widget.myOrders.order?.state ?? ''}',
                      style: TextStyle(
                          color: Color(0xff0CB359),
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  Spacer(),
                  Text(
                    '${widget.myOrders.order?.orderNumber ?? ''}',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 16),
              PickupInfo(
                title: 'Pickup address',
                name: widget.myOrders.store?.name ?? '',
                address: widget.myOrders.store?.address ?? '',
                img: widget.myOrders.store?.image ?? '',
              ),
              SizedBox(height: 16),
              PickupInfo(
                title: 'user address',
                name:
                '${widget.myOrders.order?.user?.firstName ?? ''} ${widget.myOrders.order?.user?.lastName ?? ''}',
                address: widget.myOrders.order?.user?.phone ?? '',
                img:
                "https://flower.elevateegy.com/uploads/${widget.myOrders.order?.user?.photo ?? ''}",
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}