import '../../domain/pending_entity.dart';

import '../../../../core/common/api_result.dart';

abstract class HomeDataSource {
  Future<Result<PendingDriverOrdersEntity>> getHomeData(String token);
}
