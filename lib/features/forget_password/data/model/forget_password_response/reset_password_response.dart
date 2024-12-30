import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/reset_password_entity.dart';


part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  ResetPasswordResponse({this.message, this.token, this.error});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);

  String? message;
  String? token;
  String? error;

  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);

  ResetPasswordEntity toResetPasswordEntity() {
    return ResetPasswordEntity(message: message, token: token, error: error);
  }
}
