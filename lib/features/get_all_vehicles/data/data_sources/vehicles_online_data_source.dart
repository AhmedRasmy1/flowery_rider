import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/get_all_vehicles/domain/entities/vehicles_response_entity.dart';

abstract class VehiclesOnlineDataSource {
  Future<Result<VehiclesResponseEntity>> getAllVehicles();
}
