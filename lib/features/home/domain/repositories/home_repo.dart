import 'package:flowery_rider/features/home/domain/home_entity.dart';

import '../../../../core/common/api_result.dart';
import '../pending_entity.dart';

abstract class HomeRepo {
  Future<Result<PendingDriverOrdersEntity>> getHomeData(String token);
}
