import 'package:json_annotation/json_annotation.dart';
part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPasswordRequest {
  ResetPasswordRequest({this.email, this.newPassword});

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  String? email;
  String? newPassword;

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
