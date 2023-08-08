class CitiesResponse {
  CitiesResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  CitiesResponse.fromJson(dynamic json) {
    success = json['success'] as bool?;
    statusCode = json['statusCode'] as int?;
    message = json['message'] as String?;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CityData.fromJson(v));
      });
    }
  }
  bool? success;
  int? statusCode;
  String? message;
  List<CityData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['statusCode'] = statusCode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CityData {
  CityData({
    this.id,
    this.name,
    this.countryId,
    this.createdAt,
    this.updatedAt,
  });

  CityData.fromJson(dynamic json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    countryId = json['country_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
  }
  int? id;
  String? name;
  int? countryId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['country_id'] = countryId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
