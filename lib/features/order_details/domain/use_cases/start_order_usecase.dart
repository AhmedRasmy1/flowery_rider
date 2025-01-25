import '../../../../core/common/api_result.dart';
import '../entities/start_order_entity.dart';
import '../repo/start_order_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class StartOrderUseCase {
  final StartOrderRepo _startOrderRepo;

  StartOrderUseCase(this._startOrderRepo);

  Future<Result<StartOrderEntity?>> startOrder(String orderId) async {
    return await _startOrderRepo.startOrder(orderId);
  }
}
