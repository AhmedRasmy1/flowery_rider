import 'package:dio/dio.dart';
import 'package:flowery_rider/features/auth/data/models/requests/register_request_dto.dart';
import 'package:flowery_rider/features/auth/data/models/response/register_response_dto.dart';
import 'package:flowery_rider/features/auth/domain/entities/register_entity.dart';
import 'package:flowery_rider/features/get_all_vehicles/data/models/vehicles_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../api_constants.dart';

part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  @FactoryMethod()
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiConstants.signupRoute)
  Future<RegisterResponseDto> signUp(
      @Body() RegisterRequestDto registerRequestDto);

  @GET(ApiConstants.getAllVehiclesRoute)
  Future<VehiclesResponseDto> getAllVehicles();
}
