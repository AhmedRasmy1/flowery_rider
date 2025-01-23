import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/pending_entity.dart';
import '../../domain/repositories/home_repo.dart';
import '../datasources/home_data_source.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDataSource homeDataSource;
  HomeRepoImpl(this.homeDataSource);
  @override
  Future<Result<PendingDriverOrdersEntity>> getHomeData(String token) {
    return homeDataSource.getHomeData(token);
  }
}
