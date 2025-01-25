import '../../../../core/common/api_result.dart';
import '../entities/start_order_entity.dart';

abstract class StartOrderRepo {
  Future<Result<StartOrderEntity?>> startOrder(String orderId);
}
