/// user : {"id":103,"city":null,"phone":"87089146990","name":null,"surname":null,"date":null,"iin":null,"role":null,"type":null,"avatar":null,"token":null,"promocode":null,"actived":false,"phone_verified":"2022-02-10T10:01:16.449208Z","created_at":"2022-02-10T10:01:16.000000Z","updated_at":"2022-02-10T10:01:16.000000Z","car":null,"documents":null}
/// token : "2|He7Kitv794z5QR9WrIDUA03rIHOm5XPUuPGrg2Sf"
/// message : "Success"

class PhoneCodeRegisterResponse {
  PhoneCodeRegisterResponse({
      User? user, 
      String? token, 
      String? message,}){
    _user = user;
    _token = token;
    _message = message;
}

  PhoneCodeRegisterResponse.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
    _message = json['message'];
  }
  User? _user;
  String? _token;
  String? _message;

  User? get user => _user;
  String? get token => _token;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    map['message'] = _message;
    return map;
  }

}

/// id : 103
/// city : null
/// phone : "87089146990"
/// name : null
/// surname : null
/// date : null
/// iin : null
/// role : null
/// type : null
/// avatar : null
/// token : null
/// promocode : null
/// actived : false
/// phone_verified : "2022-02-10T10:01:16.449208Z"
/// created_at : "2022-02-10T10:01:16.000000Z"
/// updated_at : "2022-02-10T10:01:16.000000Z"
/// car : null
/// documents : null

class User {
  User({
      int? id, 
      dynamic city, 
      String? phone, 
      dynamic name, 
      dynamic surname, 
      dynamic date, 
      dynamic iin, 
      dynamic role, 
      dynamic type, 
      dynamic avatar, 
      dynamic token, 
      dynamic promocode, 
      bool? actived, 
      String? phoneVerified, 
      String? createdAt, 
      String? updatedAt, 
      dynamic car, 
      dynamic documents,}){
    _id = id;
    _city = city;
    _phone = phone;
    _name = name;
    _surname = surname;
    _date = date;
    _iin = iin;
    _role = role;
    _type = type;
    _avatar = avatar;
    _token = token;
    _promocode = promocode;
    _actived = actived;
    _phoneVerified = phoneVerified;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _car = car;
    _documents = documents;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _city = json['city'];
    _phone = json['phone'];
    _name = json['name'];
    _surname = json['surname'];
    _date = json['date'];
    _iin = json['iin'];
    _role = json['role'];
    _type = json['type'];
    _avatar = json['avatar'];
    _token = json['token'];
    _promocode = json['promocode'];
    _actived = json['actived'];
    _phoneVerified = json['phone_verified'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _car = json['car'];
    _documents = json['documents'];
  }
  int? _id;
  dynamic _city;
  String? _phone;
  dynamic _name;
  dynamic _surname;
  dynamic _date;
  dynamic _iin;
  dynamic _role;
  dynamic _type;
  dynamic _avatar;
  dynamic _token;
  dynamic _promocode;
  bool? _actived;
  String? _phoneVerified;
  String? _createdAt;
  String? _updatedAt;
  dynamic _car;
  dynamic _documents;

  int? get id => _id;
  dynamic get city => _city;
  String? get phone => _phone;
  dynamic get name => _name;
  dynamic get surname => _surname;
  dynamic get date => _date;
  dynamic get iin => _iin;
  dynamic get role => _role;
  dynamic get type => _type;
  dynamic get avatar => _avatar;
  dynamic get token => _token;
  dynamic get promocode => _promocode;
  bool? get actived => _actived;
  String? get phoneVerified => _phoneVerified;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get car => _car;
  dynamic get documents => _documents;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['city'] = _city;
    map['phone'] = _phone;
    map['name'] = _name;
    map['surname'] = _surname;
    map['date'] = _date;
    map['iin'] = _iin;
    map['role'] = _role;
    map['type'] = _type;
    map['avatar'] = _avatar;
    map['token'] = _token;
    map['promocode'] = _promocode;
    map['actived'] = _actived;
    map['phone_verified'] = _phoneVerified;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['car'] = _car;
    map['documents'] = _documents;
    return map;
  }

}