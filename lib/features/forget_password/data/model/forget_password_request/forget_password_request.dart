import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request.g.dart';

@JsonSerializable()
class ForgetPasswordRequest {
  ForgetPasswordRequest({
    this.email,
  });

  factory ForgetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestFromJson(json);

  String? email;

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestToJson(this);
}
