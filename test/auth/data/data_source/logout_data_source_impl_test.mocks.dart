// Mocks generated by Mockito 5.4.4 from annotations
// in flowery_rider/test/auth/data/data_source/logout_data_source_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i14;

import 'package:flowery_rider/core/api/api_manager/api_manager.dart' as _i13;
import 'package:flowery_rider/features/auth/data/models/request/login_model_dto.dart'
    as _i15;
import 'package:flowery_rider/features/auth/data/models/response/login_response_dto.dart'
    as _i2;
import 'package:flowery_rider/features/auth/data/models/response/logout_response.dart'
    as _i3;
import 'package:flowery_rider/features/change_password/data/model/change_password_request.dart'
    as _i20;
import 'package:flowery_rider/features/change_password/data/model/change_password_response.dart'
    as _i10;
import 'package:flowery_rider/features/edit_profile/data/models/request/edit_profile_request.dart'
    as _i16;
import 'package:flowery_rider/features/edit_profile/data/models/response/edit_profile_response.dart'
    as _i6;
import 'package:flowery_rider/features/forget_password/data/model/forget_password_request/forget_password_request.dart'
    as _i17;
import 'package:flowery_rider/features/forget_password/data/model/forget_password_request/reset_password_request.dart'
    as _i19;
import 'package:flowery_rider/features/forget_password/data/model/forget_password_request/verify_request.dart'
    as _i18;
import 'package:flowery_rider/features/forget_password/data/model/forget_password_response/forget_password_response.dart'
    as _i7;
import 'package:flowery_rider/features/forget_password/data/model/forget_password_response/reset_password_response.dart'
    as _i9;
import 'package:flowery_rider/features/forget_password/data/model/forget_password_response/verify_response.dart'
    as _i8;
import 'package:flowery_rider/features/get_all_vehicles/data/models/vehicles_response_dto.dart'
    as _i4;
import 'package:flowery_rider/features/home/data/response/pending__orders__response.dart'
    as _i11;
import 'package:flowery_rider/features/my_profile/data/models/response/profile_data_model.dart'
    as _i5;
import 'package:flowery_rider/features/order_details/data/models/request/update_order_request.dart'
    as _i23;
import 'package:flowery_rider/features/order_details/data/models/response/start_order_model.dart'
    as _i21;
import 'package:flowery_rider/features/order_details/data/models/response/update_order_state_response.dart'
    as _i22;
import 'package:flowery_rider/features/orders/data/models/my_orders_response.dart'
    as _i12;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLoginResponseDto_0 extends _i1.SmartFake
    implements _i2.LoginResponseDto {
  _FakeLoginResponseDto_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLogoutResponseDto_1 extends _i1.SmartFake
    implements _i3.LogoutResponseDto {
  _FakeLogoutResponseDto_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeVehiclesResponseDto_2 extends _i1.SmartFake
    implements _i4.VehiclesResponseDto {
  _FakeVehiclesResponseDto_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProfileDataModel_3 extends _i1.SmartFake
    implements _i5.ProfileDataModel {
  _FakeProfileDataModel_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEditProfileResponse_4 extends _i1.SmartFake
    implements _i6.EditProfileResponse {
  _FakeEditProfileResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeForgetPasswordResponse_5 extends _i1.SmartFake
    implements _i7.ForgetPasswordResponse {
  _FakeForgetPasswordResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeVerifyResponse_6 extends _i1.SmartFake
    implements _i8.VerifyResponse {
  _FakeVerifyResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResetPasswordResponse_7 extends _i1.SmartFake
    implements _i9.ResetPasswordResponse {
  _FakeResetPasswordResponse_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeChangePasswordResponse_8 extends _i1.SmartFake
    implements _i10.ChangePasswordResponse {
  _FakeChangePasswordResponse_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePendingOrdersResponse_9 extends _i1.SmartFake
    implements _i11.PendingOrdersResponse {
  _FakePendingOrdersResponse_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMyOrdersResponse_10 extends _i1.SmartFake
    implements _i12.MyOrdersResponse {
  _FakeMyOrdersResponse_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i13.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i14.Future<_i2.LoginResponseDto> login(_i15.LoginModelDto? loginModelDto) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [loginModelDto],
        ),
        returnValue:
            _i14.Future<_i2.LoginResponseDto>.value(_FakeLoginResponseDto_0(
          this,
          Invocation.method(
            #login,
            [loginModelDto],
          ),
        )),
      ) as _i14.Future<_i2.LoginResponseDto>);

  @override
  _i14.Future<_i3.LogoutResponseDto> logout(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #logout,
          [token],
        ),
        returnValue:
            _i14.Future<_i3.LogoutResponseDto>.value(_FakeLogoutResponseDto_1(
          this,
          Invocation.method(
            #logout,
            [token],
          ),
        )),
      ) as _i14.Future<_i3.LogoutResponseDto>);

  @override
  _i14.Future<_i4.VehiclesResponseDto> getAllVehicles() => (super.noSuchMethod(
        Invocation.method(
          #getAllVehicles,
          [],
        ),
        returnValue: _i14.Future<_i4.VehiclesResponseDto>.value(
            _FakeVehiclesResponseDto_2(
          this,
          Invocation.method(
            #getAllVehicles,
            [],
          ),
        )),
      ) as _i14.Future<_i4.VehiclesResponseDto>);

  @override
  _i14.Future<_i5.ProfileDataModel> getProfile(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProfile,
          [token],
        ),
        returnValue:
            _i14.Future<_i5.ProfileDataModel>.value(_FakeProfileDataModel_3(
          this,
          Invocation.method(
            #getProfile,
            [token],
          ),
        )),
      ) as _i14.Future<_i5.ProfileDataModel>);

  @override
  _i14.Future<_i6.EditProfileResponse> editProfile(
    String? token,
    _i16.EditProfileRequest? editProfileRequest,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #editProfile,
          [
            token,
            editProfileRequest,
          ],
        ),
        returnValue: _i14.Future<_i6.EditProfileResponse>.value(
            _FakeEditProfileResponse_4(
          this,
          Invocation.method(
            #editProfile,
            [
              token,
              editProfileRequest,
            ],
          ),
        )),
      ) as _i14.Future<_i6.EditProfileResponse>);

  @override
  _i14.Future<_i7.ForgetPasswordResponse> forgetPassword(
          _i17.ForgetPasswordRequest? requestEmail) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgetPassword,
          [requestEmail],
        ),
        returnValue: _i14.Future<_i7.ForgetPasswordResponse>.value(
            _FakeForgetPasswordResponse_5(
          this,
          Invocation.method(
            #forgetPassword,
            [requestEmail],
          ),
        )),
      ) as _i14.Future<_i7.ForgetPasswordResponse>);

  @override
  _i14.Future<_i8.VerifyResponse> verifyPassword(
          _i18.VerifyRequest? requestOtp) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyPassword,
          [requestOtp],
        ),
        returnValue:
            _i14.Future<_i8.VerifyResponse>.value(_FakeVerifyResponse_6(
          this,
          Invocation.method(
            #verifyPassword,
            [requestOtp],
          ),
        )),
      ) as _i14.Future<_i8.VerifyResponse>);

  @override
  _i14.Future<_i9.ResetPasswordResponse> resetPassword(
          _i19.ResetPasswordRequest? requestOtp) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [requestOtp],
        ),
        returnValue: _i14.Future<_i9.ResetPasswordResponse>.value(
            _FakeResetPasswordResponse_7(
          this,
          Invocation.method(
            #resetPassword,
            [requestOtp],
          ),
        )),
      ) as _i14.Future<_i9.ResetPasswordResponse>);

  @override
  _i14.Future<_i10.ChangePasswordResponse> changePassword(
    _i20.ChangePasswordRequest? changePasswordRequest,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #changePassword,
          [
            changePasswordRequest,
            token,
          ],
        ),
        returnValue: _i14.Future<_i10.ChangePasswordResponse>.value(
            _FakeChangePasswordResponse_8(
          this,
          Invocation.method(
            #changePassword,
            [
              changePasswordRequest,
              token,
            ],
          ),
        )),
      ) as _i14.Future<_i10.ChangePasswordResponse>);

  @override
  _i14.Future<_i11.PendingOrdersResponse> getHomeData(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getHomeData,
          [token],
        ),
        returnValue: _i14.Future<_i11.PendingOrdersResponse>.value(
            _FakePendingOrdersResponse_9(
          this,
          Invocation.method(
            #getHomeData,
            [token],
          ),
        )),
      ) as _i14.Future<_i11.PendingOrdersResponse>);

  @override
  _i14.Future<_i21.StartOrderModel?> startOrder(
    String? orderId,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #startOrder,
          [
            orderId,
            token,
          ],
        ),
        returnValue: _i14.Future<_i21.StartOrderModel?>.value(),
      ) as _i14.Future<_i21.StartOrderModel?>);

  @override
  _i14.Future<_i22.UpdateOrderStateResponse?> updateOrder(
    String? orderId,
    _i23.UpdateOrderRequest? updateOrderRequest,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateOrder,
          [
            orderId,
            updateOrderRequest,
            token,
          ],
        ),
        returnValue: _i14.Future<_i22.UpdateOrderStateResponse?>.value(),
      ) as _i14.Future<_i22.UpdateOrderStateResponse?>);

  @override
  _i14.Future<_i12.MyOrdersResponse> getMyOrders(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMyOrders,
          [token],
        ),
        returnValue:
            _i14.Future<_i12.MyOrdersResponse>.value(_FakeMyOrdersResponse_10(
          this,
          Invocation.method(
            #getMyOrders,
            [token],
          ),
        )),
      ) as _i14.Future<_i12.MyOrdersResponse>);
}
