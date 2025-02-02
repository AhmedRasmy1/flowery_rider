import 'package:flowery_rider/features/orders/domain/entities/my_orders_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import 'my_orders_online_data_source.dart';

@Injectable(as: MyOrdersOnlineDataSource)
class MyOrdersOnlineDataSourceImpl implements MyOrdersOnlineDataSource {
  ApiService apiService;

  MyOrdersOnlineDataSourceImpl(this.apiService);

  @override
  Future<Result<MyOrdersEntity>> getMyOrders(String token) {
    return executeApi(() async {
      var response = await apiService.getMyOrders(token);
      print(response.orders);
      var data = response.toMyOrdersEntity();
      return data;
    });
  }
}
