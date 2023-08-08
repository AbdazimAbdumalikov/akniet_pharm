/// success : true
/// statusCode : 200
/// message : "Success!"
/// data : [{"id":1,"mark_id":1,"name":"Third Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":2,"mark_id":4,"name":"First Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":3,"mark_id":2,"name":"Third Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":4,"mark_id":5,"name":"Fifth Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":5,"mark_id":3,"name":"Fourth Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":6,"mark_id":4,"name":"First Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":7,"mark_id":2,"name":"First Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":8,"mark_id":1,"name":"Second Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":9,"mark_id":1,"name":"Second Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":10,"mark_id":1,"name":"Second Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":11,"mark_id":2,"name":"First Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":12,"mark_id":4,"name":"Fifth Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":13,"mark_id":4,"name":"Fifth Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":14,"mark_id":1,"name":"Second Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":15,"mark_id":2,"name":"Fourth Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":16,"mark_id":4,"name":"Second Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":17,"mark_id":1,"name":"First Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":18,"mark_id":2,"name":"First Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":19,"mark_id":1,"name":"Fourth Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":20,"mark_id":1,"name":"Fifth Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":21,"mark_id":3,"name":"First Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":22,"mark_id":2,"name":"First Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":23,"mark_id":2,"name":"Third Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":24,"mark_id":5,"name":"Fifth Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"},{"id":25,"mark_id":1,"name":"Fourth Ml","icon":null,"created_at":"2022-02-17T05:07:00.000000Z","updated_at":"2022-02-17T05:07:00.000000Z"}]

class MarksResponse {
  MarksResponse({
      bool? success, 
      int? statusCode, 
      String? message, 
      List<Marks>? data,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  MarksResponse.fromJson(dynamic json) {
    _success = json['success'];
    _statusCode = json['statusCode'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Marks.fromJson(v));
      });
    }
  }
  bool? _success;
  int? _statusCode;
  String? _message;
  List<Marks>? _data;

  bool? get success => _success;
  int? get statusCode => _statusCode;
  String? get message => _message;
  List<Marks>? get data => _data;

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

/// id : 1
/// mark_id : 1
/// name : "Third Ml"
/// icon : null
/// created_at : "2022-02-17T05:07:00.000000Z"
/// updated_at : "2022-02-17T05:07:00.000000Z"

class Marks {
  Marks({
      int? id, 
      int? markId, 
      String? name, 
      dynamic icon, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _markId = markId;
    _name = name;
    _icon = icon;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Marks.fromJson(dynamic json) {
    _id = json['id'];
    _markId = json['mark_id'];
    _name = json['name'];
    _icon = json['icon'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _markId;
  String? _name;
  dynamic _icon;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get markId => _markId;
  String? get name => _name;
  dynamic get icon => _icon;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['mark_id'] = _markId;
    map['name'] = _name;
    map['icon'] = _icon;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}