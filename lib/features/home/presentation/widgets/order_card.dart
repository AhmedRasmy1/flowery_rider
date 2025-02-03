import 'package:flowery_rider/core/resources/app_constants.dart';
import 'package:flowery_rider/core/resources/routes_manager.dart';

import '../../../../core/firebase_core/firebase_utils/firebase_utils.dart';
import '../../../../core/resources/custom_loading_dialog.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../data/response/pending__orders__response.dart';
import 'storeInfo.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';

class OrderCard extends StatefulWidget {
  final Orders orderPending;
  final VoidCallback onReject;

  const OrderCard(
      {required this.orderPending, required this.onReject, super.key});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Text('24 Km - 30 mins to deliver',
                style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.timer, color: Color(0xffC8D444)),
                SizedBox(width: 8),
                Text('Pending',
                    style: TextStyle(color: Color(0xffC8D444), fontSize: 16)),
                Spacer(),
                Text(
                  widget.orderPending.orderNumber ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            StoreInfo(
              title: 'store address',
              name: widget.orderPending.store?.name.toString() ?? "",
              address: widget.orderPending.store?.address.toString() ?? "",
              img: widget.orderPending.store?.image ?? " ",
            ),
            SizedBox(height: 16),
            StoreInfo(
              title: 'user address',
              name:
                  "${widget.orderPending.user?.firstName} ${widget.orderPending.user?.lastName}",
              address: widget.orderPending.user?.phone ?? "",
              img:
                  "https://flower.elevateegy.com/uploads/${widget.orderPending.user?.photo}",
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.orderPending.totalPrice.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                ElevatedButton(
                  onPressed: widget.onReject,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: ColorManager.pink),
                    foregroundColor: ColorManager.pink,
                  ),
                  child: Text('Reject'),
                ),
                ElevatedButton(
                  onPressed: isButtonDisabled
                      ? null
                      : () async {
                          setState(() {
                            isButtonDisabled = true;
                          });
                          customLoadingDialog(context);
                          try {
                            await CacheService.setData(
                              key: CacheConstants.orderPendingId,
                              value: widget.orderPending.id,
                            );
                            await FirebaseUtils.addOrderToFirebase(
                              orders: widget.orderPending,
                            );
                            await FirebaseUtils.saveDriverInOrderData(
                                CacheService.getData(
                                    key: CacheConstants.orderPendingId),
                                Driver(
                                  long: '37',
                                  lat: '24',
                                  vehicleType: driverData?.vehicleType,
                                  id: driverData?.id,
                                  phone: driverData?.phone,
                                  photo: driverData?.photo,
                                  firstName: driverData?.firstName,
                                  lastName: driverData?.lastName,
                                  email: driverData?.email,
                                ));
                            await FirebaseUtils.updateOrderState(
                              CacheService.getData(
                                  key: CacheConstants.orderPendingId),
                              OrderStateModel(
                                state: 'Accepted',
                                updatedAt: DateTime.now()
                                    .microsecondsSinceEpoch
                                    .toString(),
                              ),
                            );
                            if (mounted) {
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(
                                context,
                                RoutesManager.orderDetailsView,
                              );
                            }
                          } catch (e) {
                            if (mounted) {
                              Navigator.pop(context);
                            }
                            setState(() {
                              isButtonDisabled = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('حدث خطأ، يرجى المحاولة مرة أخرى'),
                              ),
                            );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonDisabled
                        ? ColorManager.placeHolderColor
                        : ColorManager.pink,
                  ),
                  child: Text(
                    'Accept',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
