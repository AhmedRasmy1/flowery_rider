// Mocks generated by Mockito 5.4.4 from annotations
// in flowery_rider/test/auth/data/repository/logout_repo_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flowery_rider/core/common/api_result.dart' as _i2;
import 'package:flowery_rider/features/auth/data/data_sources/auth_online_data_source.dart'
    as _i3;
import 'package:flowery_rider/features/auth/data/models/request/login_model_dto.dart'
    as _i6;
import 'package:flowery_rider/features/auth/data/models/request/register_request_dto.dart'
    as _i8;
import 'package:flowery_rider/features/auth/domain/entities/login_entity.dart'
    as _i5;
import 'package:flowery_rider/features/auth/domain/entities/logout_entity.dart'
    as _i7;
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

class _FakeResult_0<T> extends _i1.SmartFake implements _i2.Result<T> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthOnLineDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthOnLineDataSource extends _i1.Mock
    implements _i3.AuthOnLineDataSource {
  MockAuthOnLineDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Result<_i5.LoginEntitie>> login(
          _i6.LoginModelDto? loginModelDto) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [loginModelDto],
        ),
        returnValue: _i4.Future<_i2.Result<_i5.LoginEntitie>>.value(
            _FakeResult_0<_i5.LoginEntitie>(
          this,
          Invocation.method(
            #login,
            [loginModelDto],
          ),
        )),
      ) as _i4.Future<_i2.Result<_i5.LoginEntitie>>);

  @override
  _i4.Future<_i2.Result<_i7.LogoutEntity>> logout(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #logout,
          [token],
        ),
        returnValue: _i4.Future<_i2.Result<_i7.LogoutEntity>>.value(
            _FakeResult_0<_i7.LogoutEntity>(
          this,
          Invocation.method(
            #logout,
            [token],
          ),
        )),
      ) as _i4.Future<_i2.Result<_i7.LogoutEntity>>);

  @override
  _i4.Future<_i2.Result<dynamic>> signUp(
          _i8.RegisterRequestDto? registerRequestDto) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [registerRequestDto],
        ),
        returnValue:
            _i4.Future<_i2.Result<dynamic>>.value(_FakeResult_0<dynamic>(
          this,
          Invocation.method(
            #signUp,
            [registerRequestDto],
          ),
        )),
      ) as _i4.Future<_i2.Result<dynamic>>);
}
