import '../../../../core/common/api_result.dart';
import '../../domain/entities/start_order_entity.dart';

abstract class StartOrderDataSourcesRepo {
  Future<Result<StartOrderEntity?>> startOrder(String orderId);
}
