import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import 'start_order_data_sources_repo.dart';
import '../../domain/entities/start_order_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/cashed_data_shared_preferences.dart';

@Injectable(as: StartOrderDataSourcesRepo)
class StartOrderDataSourcesRepoImpl implements StartOrderDataSourcesRepo {
  ApiService apiService;

  StartOrderDataSourcesRepoImpl(this.apiService);

  @override
  Future<Result<StartOrderEntity?>> startOrder(String orderId) {
    final token = CacheService.getData(key: CacheConstants.userToken);

    return executeApi(() async {
      var response = await apiService.startOrder(orderId, 'Bearer $token');
      return response?.toStartOrderEntity();
    });
  }
}
