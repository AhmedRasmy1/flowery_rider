import 'package:flowery_rider/features/order_details/data/models/request/update_order_request.dart';

import 'package:flowery_rider/features/order_details/domain/entities/update_order_state_entity.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import 'start_order_data_sources_repo.dart';
import '../../domain/entities/start_order_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/cashed_data_shared_preferences.dart';
final token = CacheService.getData(key: CacheConstants.userToken);
@Injectable(as: OrderDetailsDataSourcesRepo)
class StartOrderDataSourcesRepoImpl implements OrderDetailsDataSourcesRepo {
  ApiService apiService;

  StartOrderDataSourcesRepoImpl(this.apiService);

  @override
  Future<Result<StartOrderEntity?>> startOrder(String orderId) {


    return executeApi(() async {
      var response = await apiService.startOrder(orderId, 'Bearer $token');
      return response?.toStartOrderEntity();
    });
  }

  @override
  Future<Result<UpdateOrderStateEntity?>> updateOrder( String orderId,UpdateOrderRequest updateOrderRequest) {
    return executeApi(() async {
      var response = await apiService.updateOrder(orderId,updateOrderRequest,'Bearer $token');
      return response?.toUpdateOrderStateEntity();
    });
  }
}
