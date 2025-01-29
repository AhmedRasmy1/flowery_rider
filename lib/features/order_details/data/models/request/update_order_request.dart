
class UpdateOrderRequest {
  UpdateOrderRequest({
    this.state,});

  UpdateOrderRequest.fromJson(dynamic json) {
    state = json['state'];
  }
  String? state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['state'] = state;
    return map;
  }

}