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

import '../../features/auth/data/data_sources/auth_online_data_source.dart'
    as _i994;
import '../../features/auth/data/data_sources/auth_online_data_source_impl.dart'
    as _i140;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i844;
import '../../features/auth/presentation/view_model/login_view_model_cubit.dart'
    as _i629;
import '../../features/auth/presentation/view_model/logout_view_model_cubit.dart'
    as _i48;
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
    gh.factory<_i994.AuthOnLineDataSource>(
        () => _i140.AuthOnLineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i723.AuthRepo>(
        () => _i662.AuthRepoImpl(gh<_i994.AuthOnLineDataSource>()));
    gh.factory<_i844.LogoutUseCases>(
        () => _i844.LogoutUseCases(gh<_i723.AuthRepo>()));
    gh.factory<_i1038.LoginUseCases>(
        () => _i1038.LoginUseCases(gh<_i723.AuthRepo>()));
    gh.factory<_i48.LogoutViewModel>(
        () => _i48.LogoutViewModel(gh<_i844.LogoutUseCases>()));
    gh.factory<_i629.LoginViewModel>(
        () => _i629.LoginViewModel(gh<_i1038.LoginUseCases>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
