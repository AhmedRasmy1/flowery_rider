import 'dart:io';
import '../entities/vehicles_response_entity.dart';
import '../repositories/vehicles_repo.dart';
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
