import 'package:bloc/bloc.dart';
import '../../domain/entities/vehicles_response_entity.dart';
import '../../domain/use_cases/vehicles_use_case.dart';
import 'vehicles_state.dart';
import '../../../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class VehiclesViewModel extends Cubit<VehiclesState> {
  List<VehiclesEntity> allVehicles = [];

  final VehiclesUseCase vehiclesUseCase;

  VehiclesViewModel(this.vehiclesUseCase) : super(InitialState());

  Future<void> getAllVehicles() async {
    emit(LoadingVehiclesState());
    print("=======================================");
    print("Fetching addresses with token: ");

    var result = await vehiclesUseCase.getAllVehicles();

    print("API Result: $result");
    print("=======================================");

    switch (result) {
      case Success<VehiclesResponseEntity>():
        print("=======================================");
        print(VehiclesResponseEntity);
        emit(SuccessVehiclesState(result.data));
        allVehicles = result.data.vehicles ?? [];
        print(allVehicles);
        print(result.data.vehicles);
      case Fail<VehiclesResponseEntity>():
        emit(ErrorVehiclesState(result.exception));
        print("=======================================");
        print("Error Occurred: ${result.exception}");
    }
  }
}
