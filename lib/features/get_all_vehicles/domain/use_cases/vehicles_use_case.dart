import 'dart:io';
import 'package:flowery_rider/features/get_all_vehicles/domain/entities/vehicles_response_entity.dart';
import 'package:flowery_rider/features/get_all_vehicles/domain/repositories/vehicles_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';

@injectable
class VehiclesUseCase {
  VehiclesRepo vehiclesRepo;

  VehiclesUseCase(this.vehiclesRepo);

  Future<Result<VehiclesResponseEntity>> getAllVehicles() {
    return vehiclesRepo.getAllVehicles();
  }
}
