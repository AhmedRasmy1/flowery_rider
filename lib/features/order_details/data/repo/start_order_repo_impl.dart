import 'package:flowery_rider/features/order_details/domain/entities/update_order_state_entity.dart';

import '../../../../core/common/api_result.dart';
import '../data_sources/start_order_data_sources_repo.dart';
import '../../domain/entities/start_order_entity.dart';
import '../../domain/repo/start_order_repo.dart';
import 'package:injectable/injectable.dart';

import '../models/request/update_order_request.dart';

@Injectable(as: OrderDetailsRepo)
class StarOrderRepoImpl implements OrderDetailsRepo {
  OrderDetailsDataSourcesRepo startOrderDataSourcesRepo;

  StarOrderRepoImpl(this.startOrderDataSourcesRepo);

  @override
  Future<Result<StartOrderEntity?>> startOrder(String orderId) async {
    return await startOrderDataSourcesRepo.startOrder(orderId);
  }

  @override
  Future<Result<UpdateOrderStateEntity?>> updateOrder(UpdateOrderRequest updateOrderRequest) async{
  return await startOrderDataSourcesRepo.updateOrder(updateOrderRequest);
  }
}
