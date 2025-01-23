
import 'package:flowery_rider/features/home/domain/home_entity.dart';
import 'package:flowery_rider/features/home/domain/pending_entity.dart';

import '../../../../core/common/api_result.dart';

abstract class HomeDataSource {
  Future<Result<PendingDriverOrdersEntity>> getHomeData(String token);
}
