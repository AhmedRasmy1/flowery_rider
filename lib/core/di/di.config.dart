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
import '../../features/auth/domain/use_cases/use_cases.dart' as _i1057;
import '../../features/auth/presentation/view_model/login_view_model_cubit.dart'
    as _i629;
import '../../features/auth/presentation/view_model/logout_view_model_cubit.dart'
    as _i48;
import '../../features/auth/presentation/view_model/register/register_cubit.dart'
    as _i70;
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
import '../../features/edit_profile/data/data_sources/edit_profile_data_source_repo.dart'
    as _i70;
import '../../features/edit_profile/data/data_sources/edit_profile_data_source_repo_impl.dart'
    as _i197;
import '../../features/edit_profile/data/repo_impl/edit_profile_repo_impl.dart'
    as _i1035;
import '../../features/edit_profile/domain/repositories/edit_profile_repo.dart'
    as _i164;
import '../../features/edit_profile/domain/use_cases/edit_profile_usecase.dart'
    as _i790;
import '../../features/edit_profile/presentation/manager/edit_profile_cubit.dart'
    as _i936;
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
import '../../features/home/data/datasources/home_data_source.dart' as _i426;
import '../../features/home/data/datasources/home_data_source_impl.dart'
    as _i375;
import '../../features/home/data/repository/home_repo_impl.dart' as _i1013;
import '../../features/home/domain/repositories/home_repo.dart' as _i1021;
import '../../features/home/domain/Use_case/home_use_case.dart' as _i743;
import '../../features/home/presentation/view_model/home_view_model.dart'
    as _i77;
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
    gh.factory<_i710.VehiclesOnlineDataSource>(
        () => _i347.VehiclesOnlineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i426.HomeDataSource>(
        () => _i375.HomeDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i649.GetProfileDataSource>(
        () => _i592.GetProfileDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i994.AuthOnLineDataSource>(
        () => _i140.AuthOnLineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i1021.HomeRepo>(
        () => _i1013.HomeRepoImpl(gh<_i426.HomeDataSource>()));
    gh.factory<_i70.EditProfileDataSource>(
        () => _i197.EditProfileDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i740.ForgetPasswordOnlineDatasource>(
        () => _i470.ForgetPasswordOnlineDatasourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i743.HomeUseCase>(
        () => _i743.HomeUseCase(gh<_i1021.HomeRepo>()));
    gh.factory<_i566.VehiclesRepo>(
        () => _i307.VehiclesRepoImpl(gh<_i710.VehiclesOnlineDataSource>()));
    gh.factory<_i804.ChangePasswordOnlineDataSource>(
        () => _i427.ChangePasswordOnlineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i184.ForgetPasswordRepo>(() => _i732.ForgetPasswordRepoImpl(
        gh<_i740.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i164.EditProfileRepo>(
        () => _i1035.EditProfileRepoImpl(gh<_i70.EditProfileDataSource>()));
    gh.factory<_i737.GetProfileRepo>(
        () => _i938.GetProfileRepoImpl(gh<_i649.GetProfileDataSource>()));
    gh.factory<_i77.HomeCubit>(() => _i77.HomeCubit(gh<_i743.HomeUseCase>()));
    gh.factory<_i802.ChangePasswordRepository>(() =>
        _i489.ChangePasswordRepositoryImpl(
            gh<_i804.ChangePasswordOnlineDataSource>()));
    gh.factory<_i723.AuthRepo>(
        () => _i662.AuthRepoImpl(gh<_i994.AuthOnLineDataSource>()));
    gh.factory<_i282.ChangePasswordUseCase>(() =>
        _i282.ChangePasswordUseCase(gh<_i802.ChangePasswordRepository>()));
    gh.factory<_i493.GetProfileUseCase>(
        () => _i493.GetProfileUseCase(gh<_i737.GetProfileRepo>()));
    gh.factory<_i427.ForgetPasswordUseCase>(
        () => _i427.ForgetPasswordUseCase(gh<_i184.ForgetPasswordRepo>()));
    gh.factory<_i174.ResetPasswordUseCase>(
        () => _i174.ResetPasswordUseCase(gh<_i184.ForgetPasswordRepo>()));
    gh.factory<_i135.VerifyUseCase>(
        () => _i135.VerifyUseCase(gh<_i184.ForgetPasswordRepo>()));
    gh.factory<_i844.GetProfileDataCubit>(
        () => _i844.GetProfileDataCubit(gh<_i493.GetProfileUseCase>()));
    gh.factory<_i319.ChangePasswordViewModel>(
        () => _i319.ChangePasswordViewModel(gh<_i282.ChangePasswordUseCase>()));
    gh.factory<_i87.ForgetPasswordViewModel>(
        () => _i87.ForgetPasswordViewModel(gh<_i427.ForgetPasswordUseCase>()));
    gh.factory<_i790.EditProfileUseCase>(
        () => _i790.EditProfileUseCase(gh<_i164.EditProfileRepo>()));
    gh.factory<_i353.ResetPasswordViewModel>(
        () => _i353.ResetPasswordViewModel(gh<_i174.ResetPasswordUseCase>()));
    gh.factory<_i936.EditProfileCubit>(
        () => _i936.EditProfileCubit(gh<_i790.EditProfileUseCase>()));
    gh.factory<_i103.VehiclesUseCase>(
        () => _i103.VehiclesUseCase(gh<_i566.VehiclesRepo>()));
    gh.factory<_i986.VerifyPasswordViewModel>(
        () => _i986.VerifyPasswordViewModel(gh<_i135.VerifyUseCase>()));
    gh.factory<_i844.LogoutUseCases>(
        () => _i844.LogoutUseCases(gh<_i723.AuthRepo>()));
    gh.factory<_i1038.LoginUseCases>(
        () => _i1038.LoginUseCases(gh<_i723.AuthRepo>()));
    gh.factory<_i1057.RegisterUseCase>(
        () => _i1057.RegisterUseCase(gh<_i723.AuthRepo>()));
    gh.factory<_i48.LogoutViewModel>(
        () => _i48.LogoutViewModel(gh<_i844.LogoutUseCases>()));
    gh.factory<_i953.VehiclesViewModel>(
        () => _i953.VehiclesViewModel(gh<_i103.VehiclesUseCase>()));
    gh.factory<_i70.RegisterViewModel>(
        () => _i70.RegisterViewModel(gh<_i1057.RegisterUseCase>()));
    gh.factory<_i629.LoginViewModel>(
        () => _i629.LoginViewModel(gh<_i1038.LoginUseCases>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
