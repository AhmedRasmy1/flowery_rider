import '../../../../core/common/api_result.dart';
import '../entities/vehicles_response_entity.dart';

abstract class VehiclesRepo {
  Future<Result<VehiclesResponseEntity>> getAllVehicles();
}
