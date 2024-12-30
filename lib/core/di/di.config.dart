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

import '../../features/my_profile/data/data_sources/get_profile_repo.dart'
    as _i649;
import '../../features/my_profile/data/data_sources/get_profile_repo_impl.dart'
    as _i592;
import '../../features/my_profile/data/repositories/get_profile_repo_impl.dart'
    as _i938;
import '../../features/my_profile/domain/repositories/profile_repo.dart'
    as _i737;
import '../../features/my_profile/domain/use_cases/profile_usecase.dart'
    as _i493;
import '../../features/my_profile/presentation/manager/get_profile_data_cubit.dart'
    as _i844;
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
    gh.factory<_i649.GetProfileDataSource>(
        () => _i592.GetProfileDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i737.GetProfileRepo>(
        () => _i938.GetProfileRepoImpl(gh<_i649.GetProfileDataSource>()));
    gh.factory<_i493.GetProfileUseCase>(
        () => _i493.GetProfileUseCase(gh<_i737.GetProfileRepo>()));
    gh.factory<_i844.GetProfileDataCubit>(
        () => _i844.GetProfileDataCubit(gh<_i493.GetProfileUseCase>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
