
import 'package:flowery_rider/features/home/data/response/driver_orders_response.dart';
import 'package:flowery_rider/features/home/domain/home_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/home_entity.dart';
import '../../domain/pending_entity.dart';
import 'home_data_source.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  ApiService apiService;
  HomeDataSourceImpl(this.apiService);
  @override
  Future<Result<PendingDriverOrdersEntity>> getHomeData(String token) {
    return executeApi(() async {
      var response = await apiService.getHomeData(token);
      print(response.orders);
      var data = response.toPendingDriverOrderEntity();
      return data;
    });
  }
}
