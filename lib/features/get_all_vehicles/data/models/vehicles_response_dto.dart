import '../../domain/entities/vehicles_response_entity.dart';

class VehiclesResponseDto {
  VehiclesResponseDto({
    this.message,
    this.metadata,
    this.vehicles,
  });

  VehiclesResponseDto.fromJson(dynamic json) {
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['vehicles'] != null) {
      vehicles = [];
      json['vehicles'].forEach((v) {
        vehicles?.add(Vehicles.fromJson(v));
      });
    }
  }

  String? message;
  Metadata? metadata;
  List<Vehicles>? vehicles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (vehicles != null) {
      map['vehicles'] = vehicles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  VehiclesResponseEntity toVehicleResponseEntity() {
    return VehiclesResponseEntity(
      message: message,
      vehicles: vehicles?.map((vehicle) => vehicle.toVehicleEntity()).toList(),
    );
  }
}

class Vehicles {
  Vehicles({
    this.id,
    this.type,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Vehicles.fromJson(dynamic json) {
    id = json['_id'];
    type = json['type'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? type;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['type'] = type;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

  VehiclesEntity toVehicleEntity() {
    return VehiclesEntity(id: id, image: image, type: type);
  }
}

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  int? currentPage;
  int? numberOfPages;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }
}
