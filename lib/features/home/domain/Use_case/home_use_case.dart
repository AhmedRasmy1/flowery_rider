import '../repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../pending_entity.dart';

@injectable
class HomeUseCase {
  final HomeRepo homeRepo;
  HomeUseCase(this.homeRepo);
  Future<Result<PendingDriverOrdersEntity>> getHomeData(String token) {
    return homeRepo.getHomeData(token);
  }
}
