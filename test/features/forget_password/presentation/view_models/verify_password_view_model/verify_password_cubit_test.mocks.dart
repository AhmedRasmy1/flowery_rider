// Mocks generated by Mockito 5.4.5 from annotations
// in flowery_rider/test/features/forget_password/presentation/view_models/verify_password_view_model/verify_password_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flowery_rider/core/common/api_result.dart' as _i3;
import 'package:flowery_rider/features/forget_password/domain/entities/verify_password_entity.dart'
    as _i6;
import 'package:flowery_rider/features/forget_password/domain/repositories/forget_password_repo.dart'
    as _i2;
import 'package:flowery_rider/features/forget_password/domain/use_case/verify_uce_case.dart'
    as _i4;
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

class _FakeForgetPasswordRepo_0 extends _i1.SmartFake
    implements _i2.ForgetPasswordRepo {
  _FakeForgetPasswordRepo_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeResult_1<T> extends _i1.SmartFake implements _i3.Result<T> {
  _FakeResult_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [VerifyUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockVerifyUseCase extends _i1.Mock implements _i4.VerifyUseCase {
  MockVerifyUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ForgetPasswordRepo get forgetPasswordRepo =>
      (super.noSuchMethod(
            Invocation.getter(#forgetPasswordRepo),
            returnValue: _FakeForgetPasswordRepo_0(
              this,
              Invocation.getter(#forgetPasswordRepo),
            ),
          )
          as _i2.ForgetPasswordRepo);

  @override
  set forgetPasswordRepo(_i2.ForgetPasswordRepo? _forgetPasswordRepo) =>
      super.noSuchMethod(
        Invocation.setter(#forgetPasswordRepo, _forgetPasswordRepo),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<_i3.Result<_i6.VerifyPasswordEntity?>> invoke(String? otp) =>
      (super.noSuchMethod(
            Invocation.method(#invoke, [otp]),
            returnValue:
                _i5.Future<_i3.Result<_i6.VerifyPasswordEntity?>>.value(
                  _FakeResult_1<_i6.VerifyPasswordEntity?>(
                    this,
                    Invocation.method(#invoke, [otp]),
                  ),
                ),
          )
          as _i5.Future<_i3.Result<_i6.VerifyPasswordEntity?>>);
}
