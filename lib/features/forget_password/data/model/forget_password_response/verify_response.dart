import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/verify_password_entity.dart';


part 'verify_response.g.dart';

@JsonSerializable()
class VerifyResponse {
  VerifyResponse({this.status, this.error});

  factory VerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseFromJson(json);

  String? status;
  String? error;

  Map<String, dynamic> toJson() => _$VerifyResponseToJson(this);

  VerifyPasswordEntity toVerifyPasswordEntity() {
    return VerifyPasswordEntity(status: status, error: error);
  }
}
