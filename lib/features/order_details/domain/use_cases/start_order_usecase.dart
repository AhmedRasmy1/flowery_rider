import '../../../../core/common/api_result.dart';
import '../../data/models/request/update_order_request.dart';
import '../entities/start_order_entity.dart';
import '../entities/update_order_state_entity.dart';
import '../repo/start_order_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class StartOrderUseCase {
  final OrderDetailsRepo _startOrderRepo;

  StartOrderUseCase(this._startOrderRepo);

  Future<Result<StartOrderEntity?>> startOrder(String orderId) async {
    return await _startOrderRepo.startOrder(orderId);
  }

  Future<Result<UpdateOrderStateEntity?>> updateOrder(String orderId,UpdateOrderRequest updateOrderRequest) async {
    return await _startOrderRepo.updateOrder(orderId,updateOrderRequest);
  }
}
