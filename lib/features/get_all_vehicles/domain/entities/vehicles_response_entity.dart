class VehiclesResponseEntity {
  VehiclesResponseEntity({
    this.message,
    this.vehicles,});

  String? message;
  List<VehiclesEntity>? vehicles;

}

class VehiclesEntity {
  VehiclesEntity({
    this.id,
    this.type,
    this.image,
});

  String? id;
  String? type;
  String? image;

}
