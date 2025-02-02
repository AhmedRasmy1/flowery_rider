import 'package:flowery_rider/features/orders/domain/entities/my_orders_entity.dart';

import '../../../../core/common/api_result.dart';

abstract class MyOrdersOnlineDataSource {
  Future<Result<MyOrdersEntity>> getMyOrders(String token);
}
