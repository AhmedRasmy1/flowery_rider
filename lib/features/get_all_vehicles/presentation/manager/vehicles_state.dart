import '../../domain/entities/vehicles_response_entity.dart';

sealed class VehiclesState {}

class InitialState extends VehiclesState {}

class SuccessVehiclesState extends VehiclesState {
  final VehiclesResponseEntity vehicles;

  SuccessVehiclesState(this.vehicles);
}

class LoadingVehiclesState extends VehiclesState {}

class ErrorVehiclesState extends VehiclesState {
  Exception? exception;

  ErrorVehiclesState(this.exception);
}
