import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/order_details/domain/entities/start_order_entity.dart';

abstract class StartOrderRepo {
  Future<Result<StartOrderEntity?>> startOrder(String orderId);
}
