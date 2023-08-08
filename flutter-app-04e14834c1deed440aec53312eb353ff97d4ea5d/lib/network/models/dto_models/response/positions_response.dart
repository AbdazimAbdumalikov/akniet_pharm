/// success : true
/// statusCode : 200
/// message : "Success!"
/// data : [{"id":1,"title":"Gonzalo"},{"id":2,"title":"Ima"},{"id":3,"title":"Quinn"},{"id":4,"title":"Eduardo"},{"id":5,"title":"Kyra"},{"id":6,"title":"Waino"},{"id":7,"title":"Adelle"},{"id":8,"title":"Malcolm"},{"id":9,"title":"Grover"},{"id":10,"title":"Eriberto"}]

class PositionsResponse {
  PositionsResponse({
      bool? success, 
      int? statusCode, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  PositionsResponse.fromJson(dynamic json) {
    _success = json['success'];
    _statusCode = json['statusCode'];
    _message = json['message'];
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

/// id : 1
/// title : "Gonzalo"

class Data {
  Data({
      int? id, 
      String? title,}){
    _id = id;
    _title = title;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }
  int? _id;
  String? _title;

  int? get id => _id;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    return map;
  }

}