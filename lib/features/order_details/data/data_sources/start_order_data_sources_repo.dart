import '../../../../core/common/api_result.dart';
import '../../domain/entities/start_order_entity.dart';
import '../../domain/entities/update_order_state_entity.dart';
import '../models/request/update_order_request.dart';

abstract class OrderDetailsDataSourcesRepo {
  Future<Result<StartOrderEntity?>> startOrder(String orderId);
  Future<Result<UpdateOrderStateEntity?>> updateOrder(String orderId,UpdateOrderRequest updateOrderRequest);
}
