import 'package:flowery_rider/core/api/api_extentions.dart';
import 'package:flowery_rider/core/api/api_manager/api_manager.dart';
import 'package:flowery_rider/core/common/api_result.dart';

import 'package:flowery_rider/features/get_all_vehicles/domain/entities/vehicles_response_entity.dart';
import 'package:injectable/injectable.dart';

import 'vehicles_online_data_source.dart';

@Injectable(as: VehiclesOnlineDataSource)
class VehiclesOnlineDataSourceImpl extends VehiclesOnlineDataSource {
  ApiService _vehicleRetrofit;

  VehiclesOnlineDataSourceImpl(this._vehicleRetrofit);

  @override
  Future<Result<VehiclesResponseEntity>> getAllVehicles() {
    return executeApi(() async {
      var response = await _vehicleRetrofit.getAllVehicles();
      return response.toVehicleResponseEntity();
    });
  }
}
