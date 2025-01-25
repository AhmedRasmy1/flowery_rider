import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/order_details/domain/entities/start_order_entity.dart';

abstract class StartOrderDataSourcesRepo {
  Future<Result<StartOrderEntity?>> startOrder(String orderId);
}
