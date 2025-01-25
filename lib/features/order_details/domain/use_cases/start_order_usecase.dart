import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/order_details/domain/entities/start_order_entity.dart';
import 'package:flowery_rider/features/order_details/domain/repo/start_order_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class StartOrderUseCase {
  final StartOrderRepo _startOrderRepo;

  StartOrderUseCase(this._startOrderRepo);

  Future<Result<StartOrderEntity?>> startOrder(String orderId) async {
    return await _startOrderRepo.startOrder(orderId);
  }
}
