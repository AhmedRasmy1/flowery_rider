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

import '../../features/change_password/data/data_source/change_password_online_data_source.dart'
    as _i804;
import '../../features/change_password/data/data_source/change_password_online_data_source_impl.dart'
    as _i427;
import '../../features/change_password/data/repositories/change_password_repository_impl.dart'
    as _i489;
import '../../features/change_password/domain/repositories/change_password_repository.dart'
    as _i802;
import '../../features/change_password/domain/use_case/change_password_use_case.dart'
    as _i282;
import '../../features/change_password/presentation/view_model/change_password_cubit.dart'
    as _i319;
import '../../features/forget_password/data/data_source/forget_password_online_datasource.dart'
    as _i740;
import '../../features/forget_password/data/data_source/forget_password_online_datasource_impl.dart'
    as _i470;
import '../../features/forget_password/data/repositories/forget_password_repo_impl.dart'
    as _i732;
import '../../features/forget_password/domain/repositories/forget_password_repo.dart'
    as _i184;
import '../../features/forget_password/domain/use_case/forget_password_use_case.dart'
    as _i427;
import '../../features/forget_password/domain/use_case/reset_password_usecase.dart'
    as _i174;
import '../../features/forget_password/domain/use_case/verify_uce_case.dart'
    as _i135;
import '../../features/forget_password/presentation/view_models/forget_password_view_model/forget_password_cubit.dart'
    as _i87;
import '../../features/forget_password/presentation/view_models/reset_password_view_model/reset_password_cubit.dart'
    as _i353;
import '../../features/forget_password/presentation/view_models/verify_password_view_model/verify_password_cubit.dart'
    as _i986;
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
    gh.factory<_i740.ForgetPasswordOnlineDatasource>(
        () => _i470.ForgetPasswordOnlineDatasourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i804.ChangePasswordOnlineDataSource>(
        () => _i427.ChangePasswordOnlineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i184.ForgetPasswordRepo>(() => _i732.ForgetPasswordRepoImpl(
        gh<_i740.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i802.ChangePasswordRepository>(() =>
        _i489.ChangePasswordRepositoryImpl(
            gh<_i804.ChangePasswordOnlineDataSource>()));
    gh.factory<_i282.ChangePasswordUseCase>(() =>
        _i282.ChangePasswordUseCase(gh<_i802.ChangePasswordRepository>()));
    gh.factory<_i427.ForgetPasswordUseCase>(
        () => _i427.ForgetPasswordUseCase(gh<_i184.ForgetPasswordRepo>()));
    gh.factory<_i174.ResetPasswordUseCase>(
        () => _i174.ResetPasswordUseCase(gh<_i184.ForgetPasswordRepo>()));
    gh.factory<_i135.VerifyUseCase>(
        () => _i135.VerifyUseCase(gh<_i184.ForgetPasswordRepo>()));
    gh.factory<_i319.ChangePasswordViewModel>(
        () => _i319.ChangePasswordViewModel(gh<_i282.ChangePasswordUseCase>()));
    gh.factory<_i87.ForgetPasswordViewModel>(
        () => _i87.ForgetPasswordViewModel(gh<_i427.ForgetPasswordUseCase>()));
    gh.factory<_i353.ResetPasswordViewModel>(
        () => _i353.ResetPasswordViewModel(gh<_i174.ResetPasswordUseCase>()));
    gh.factory<_i986.VerifyPasswordViewModel>(
        () => _i986.VerifyPasswordViewModel(gh<_i135.VerifyUseCase>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
