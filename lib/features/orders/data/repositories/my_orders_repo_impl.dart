import 'package:flowery_rider/features/orders/data/data_sources/my_orders_online_data_source.dart';
import 'package:flowery_rider/features/orders/domain/entities/my_orders_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/repositories/my_orders_repo.dart';

@Injectable(as: MyOrdersRepo)
class MyOrdersRepoImpl implements MyOrdersRepo {
  MyOrdersOnlineDataSource myOrdersOnlineDataSource;

  MyOrdersRepoImpl(this.myOrdersOnlineDataSource);

  @override
  Future<Result<MyOrdersEntity>> getMyOrders(String token) {
    return myOrdersOnlineDataSource.getMyOrders(token);
  }
}
