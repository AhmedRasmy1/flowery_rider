import '../../../../core/common/api_result.dart';
import '../../domain/entities/vehicles_response_entity.dart';

abstract class VehiclesOnlineDataSource {
  Future<Result<VehiclesResponseEntity>> getAllVehicles();
}
