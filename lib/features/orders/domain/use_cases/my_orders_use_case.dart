import 'package:flowery_rider/features/orders/domain/entities/my_orders_entity.dart';
import 'package:flowery_rider/features/orders/domain/repositories/my_orders_repo.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';

@injectable
class MyOrdersUseCase {
  final MyOrdersRepo myOrdersRepo;

  MyOrdersUseCase(this.myOrdersRepo);

  Future<Result<MyOrdersEntity>> getMyOrders(String token) {
    return myOrdersRepo.getMyOrders(token);
  }
}
