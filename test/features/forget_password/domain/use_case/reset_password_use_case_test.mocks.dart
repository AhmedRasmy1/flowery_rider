// Mocks generated by Mockito 5.4.5 from annotations
// in flowery_rider/test/features/forget_password/domain/use_case/reset_password_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flowery_rider/core/common/api_result.dart' as _i2;
import 'package:flowery_rider/features/forget_password/domain/entities/forget_password_entity.dart'
    as _i5;
import 'package:flowery_rider/features/forget_password/domain/entities/reset_password_entity.dart'
    as _i7;
import 'package:flowery_rider/features/forget_password/domain/entities/verify_password_entity.dart'
    as _i6;
import 'package:flowery_rider/features/forget_password/domain/repositories/forget_password_repo.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
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

/// A class which mocks [ForgetPasswordRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockForgetPasswordRepo extends _i1.Mock
    implements _i3.ForgetPasswordRepo {
  MockForgetPasswordRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Result<_i5.ForgetPasswordEntity?>> forgetPassword(
          String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgetPassword,
          [email],
        ),
        returnValue: _i4.Future<_i2.Result<_i5.ForgetPasswordEntity?>>.value(
            _FakeResult_0<_i5.ForgetPasswordEntity?>(
          this,
          Invocation.method(
            #forgetPassword,
            [email],
          ),
        )),
      ) as _i4.Future<_i2.Result<_i5.ForgetPasswordEntity?>>);

  @override
  _i4.Future<_i2.Result<_i6.VerifyPasswordEntity?>> verifyPassword(
          String? otp) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyPassword,
          [otp],
        ),
        returnValue: _i4.Future<_i2.Result<_i6.VerifyPasswordEntity?>>.value(
            _FakeResult_0<_i6.VerifyPasswordEntity?>(
          this,
          Invocation.method(
            #verifyPassword,
            [otp],
          ),
        )),
      ) as _i4.Future<_i2.Result<_i6.VerifyPasswordEntity?>>);

  @override
  _i4.Future<_i2.Result<_i7.ResetPasswordEntity?>> resetPassword(
    String? email,
    String? newPassword,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [
            email,
            newPassword,
          ],
        ),
        returnValue: _i4.Future<_i2.Result<_i7.ResetPasswordEntity?>>.value(
            _FakeResult_0<_i7.ResetPasswordEntity?>(
          this,
          Invocation.method(
            #resetPassword,
            [
              email,
              newPassword,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Result<_i7.ResetPasswordEntity?>>);
}