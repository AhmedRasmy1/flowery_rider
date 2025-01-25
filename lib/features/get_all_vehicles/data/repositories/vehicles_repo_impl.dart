import 'dart:io';

import '../../../../core/common/api_result.dart';

import '../../domain/entities/vehicles_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/vehicles_repo.dart';
import '../data_sources/vehicles_online_data_source.dart';

@Injectable(as: VehiclesRepo)
class VehiclesRepoImpl extends VehiclesRepo {
  VehiclesOnlineDataSource onLineDataSource;

  VehiclesRepoImpl(
    this.onLineDataSource,
  );

  @override
  Future<Result<VehiclesResponseEntity>> getAllVehicles() {
    return onLineDataSource.getAllVehicles();
  }
}
