import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';

import '../../domain/entities/vehicles_response_entity.dart';
import 'package:injectable/injectable.dart';

import 'vehicles_online_data_source.dart';

@Injectable(as: VehiclesOnlineDataSource)
class VehiclesOnlineDataSourceImpl extends VehiclesOnlineDataSource {
  final ApiService _vehicleRetrofit;

  VehiclesOnlineDataSourceImpl(this._vehicleRetrofit);

  @override
  Future<Result<VehiclesResponseEntity>> getAllVehicles() {
    return executeApi(() async {
      var response = await _vehicleRetrofit.getAllVehicles();
      return response.toVehicleResponseEntity();
    });
  }
}
