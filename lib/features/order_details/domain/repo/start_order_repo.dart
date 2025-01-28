import '../../../../core/common/api_result.dart';
import '../../data/models/request/update_order_request.dart';
import '../entities/start_order_entity.dart';
import '../entities/update_order_state_entity.dart';

abstract class OrderDetailsRepo {
  Future<Result<StartOrderEntity?>> startOrder(String orderId);
  Future<Result<UpdateOrderStateEntity?>> updateOrder(String orderId,UpdateOrderRequest updateOrderRequest);
}
