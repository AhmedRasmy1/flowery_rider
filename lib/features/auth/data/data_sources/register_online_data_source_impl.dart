import 'dart:io';

import 'package:flowery_rider/features/auth/data/data_sources/register_online_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager_register.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/register_entities/register_entity.dart';
import '../models/request/register_request_dto.dart';

@Injectable(as: RegisterOnlineDataSource)
class RegisterOnlineDataSourceImpl implements RegisterOnlineDataSource {
  final RegisterApiManager registerApiManager;
  RegisterOnlineDataSourceImpl(this.registerApiManager);
  @override
  Future<Result<RegisterEntity?>> signUp(RegisterRequestDto registerRequestDto) {
    {

      return executeApi(() async {
        var response = await registerApiManager.signUp(
            country: registerRequestDto.country??"",
            firstName: registerRequestDto.firstName??"",
            lastName: registerRequestDto.lastName??"",
            vehicleType: registerRequestDto.vehicleType??"",
            vehicleNumber: registerRequestDto.vehicleNumber??"",
            vehicleLicense: registerRequestDto.vehicleLicense as File,
            nid:registerRequestDto.nid??"",
            nidImg: registerRequestDto.nidImg as File,
            email: registerRequestDto.email??"",
            password:registerRequestDto.password??"",
            rePassword: registerRequestDto.rePassword??"",
            gender: registerRequestDto.gender??"",
            phone: registerRequestDto.phone??""

        );
        return response.toRegisterEntity();
      });
    }
  }



}