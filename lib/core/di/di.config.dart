// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_sources/auth_online_data_source_impl.dart'
    as _i140;
import '../../features/auth/data/data_sources/auth_online_data_sources.dart'
    as _i608;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/use_cases/use_cases.dart' as _i1057;
import '../../features/auth/presentation/view_model/register/register_cubit.dart'
    as _i70;
import '../../features/get_all_vehicles/data/data_sources/vehicles_online_data_source.dart'
    as _i710;
import '../../features/get_all_vehicles/data/data_sources/vehicles_online_data_source_impl.dart'
    as _i347;
import '../../features/get_all_vehicles/data/repositories/vehicles_repo_impl.dart'
    as _i307;
import '../../features/get_all_vehicles/domain/repositories/vehicles_repo.dart'
    as _i566;
import '../../features/get_all_vehicles/domain/use_cases/vehicles_use_case.dart'
    as _i103;
import '../../features/get_all_vehicles/presentation/manager/vehicles_cubit.dart'
    as _i953;
import '../api/api_manager/api_manager.dart' as _i680;
import '../api/dio_module.dart' as _i784;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.providerDio());
    gh.factory<_i680.ApiService>(() => _i680.ApiService(gh<_i361.Dio>()));
    gh.factory<_i710.VehiclesOnlineDataSource>(
        () => _i347.VehiclesOnlineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i608.AuthOnlineDataSource>(
        () => _i140.AuthOnlineDataSourceImp(gh<_i680.ApiService>()));
    gh.factory<_i566.VehiclesRepo>(
        () => _i307.VehiclesRepoImpl(gh<_i710.VehiclesOnlineDataSource>()));
    gh.factory<_i723.AuthRepo>(
        () => _i662.AuthRepoImpl(gh<_i608.AuthOnlineDataSource>()));
    gh.factory<_i1057.RegisterUseCase>(
        () => _i1057.RegisterUseCase(gh<_i723.AuthRepo>()));
    gh.factory<_i70.RegisterViewModel>(
        () => _i70.RegisterViewModel(gh<_i1057.RegisterUseCase>()));
    gh.factory<_i103.VehiclesUseCase>(
        () => _i103.VehiclesUseCase(gh<_i566.VehiclesRepo>()));
    gh.factory<_i953.VehiclesViewModel>(
        () => _i953.VehiclesViewModel(gh<_i103.VehiclesUseCase>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
