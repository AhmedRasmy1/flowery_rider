import 'package:json_annotation/json_annotation.dart';
part 'verify_request.g.dart';

@JsonSerializable()
class VerifyRequest {
  VerifyRequest({
    this.resetCode,
  });

  factory VerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyRequestFromJson(json);

  String? resetCode;

  Map<String, dynamic> toJson() => _$VerifyRequestToJson(this);
}
