class MapModel {
  MapModel({
    bool? success,
    int? statusCode,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _statusCode = statusCode;
    _message = message;
    _data = data;
  }

  MapModel.fromJson(dynamic json) {
    _success = json['success'] as bool?;
    _statusCode = json['statusCode'] as int?;
    _message = json['message'] as String?;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  int? _statusCode;
  String? _message;
  List<Data>? _data;

  bool? get success => _success;
  int? get statusCode => _statusCode;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    int? id,
    String? name,
    String? address,
    String? status,
    String? date,
    String? from,
    String? to,
    double? lat,
    double? long,
    String? type,
    String? eta,
    List<Products>? products,
    int? countProducts,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _address = address;
    _status = status;
    _date = date;
    _from = from;
    _to = to;
    _lat = lat;
    _long = long;
    _type = type;
    _eta = eta;
    _products = products;
    _countProducts = countProducts;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
    _status = json['status'];
    _date = json['date'];
    _from = json['from'];
    _to = json['to'];
    _lat = json['lat'];
    _long = json['long'];
    _type = json['type'];
    _eta = json['eta'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _countProducts = json['count_products'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _address;
  String? _status;
  String? _date;
  String? _from;
  String? _to;
  double? _lat;
  double? _long;
  String? _type;
  String? _eta;
  List<Products>? _products;
  int? _countProducts;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get address => _address;
  String? get status => _status;
  String? get date => _date;
  String? get from => _from;
  String? get to => _to;
  double? get lat => _lat;
  double? get long => _long;
  String? get type => _type;
  String? get eta => _eta;
  List<Products>? get products => _products;
  int? get countProducts => _countProducts;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['address'] = _address;
    map['status'] = _status;
    map['date'] = _date;
    map['from'] = _from;
    map['to'] = _to;
    map['lat'] = _lat;
    map['long'] = _long;
    map['type'] = _type;
    map['eta'] = _eta;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['count_products'] = _countProducts;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Products {
  Products({
    int? id,
    int? point,
    String? name,
    String? code,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _point = point;
    _name = name;
    _code = code;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _point = json['point'];
    _name = json['name'];
    _code = json['code'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _point;
  String? _name;
  String? _code;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get point => _point;
  String? get name => _name;
  String? get code => _code;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['point'] = _point;
    map['name'] = _name;
    map['code'] = _code;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
