/// success : true
/// statusCode : 200
/// message : "Смс с кодом 12345 отправлен"
/// data : ""

class PhoneRegisterResponse {
  PhoneRegisterResponse({
      bool? success, 
      int? statusCode, 
      String? message, 
      String? data,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  PhoneRegisterResponse.fromJson(dynamic json) {
    _success = json['success'];
    _statusCode = json['statusCode'];
    _message = json['message'];
    _data = json['data'];
  }
  bool? _success;
  int? _statusCode;
  String? _message;
  String? _data;

  bool? get success => _success;
  int? get statusCode => _statusCode;
  String? get message => _message;
  String? get data => _data;
}