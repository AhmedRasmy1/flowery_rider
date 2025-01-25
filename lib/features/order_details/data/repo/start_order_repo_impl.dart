import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/order_details/data/data_sources/start_order_data_sources_repo.dart';
import 'package:flowery_rider/features/order_details/domain/entities/start_order_entity.dart';
import 'package:flowery_rider/features/order_details/domain/repo/start_order_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: StartOrderRepo)
class StarOrderRepoImpl implements StartOrderRepo {
  StartOrderDataSourcesRepo startOrderDataSourcesRepo;

  StarOrderRepoImpl(this.startOrderDataSourcesRepo);

  @override
  Future<Result<StartOrderEntity?>> startOrder(String orderId) async {
    return await startOrderDataSourcesRepo.startOrder(orderId);
  }
}
