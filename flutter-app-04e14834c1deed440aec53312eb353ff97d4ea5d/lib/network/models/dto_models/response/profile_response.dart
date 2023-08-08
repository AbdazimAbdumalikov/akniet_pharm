// /// success : true
// /// statusCode : 200
// /// message : "Success"
// /// data : {"id":102,"city":null,"phone":"77089146990","name":null,"surname":null,"date":null,"iin":null,"role":"user","type":"hired","avatar":null,"token":null,"promocode":null,"actived":false,"phone_verified":"2022-02-15 18:53:46","created_at":"2022-02-15T12:53:46.000000Z","updated_at":"2022-02-15T12:54:07.000000Z","documents":null}

// class ProfileResponse {
//   ProfileResponse({
//     bool? success,
//     int? statusCode,
//     String? message,
//     Data? data,
//   }) {
//     _success = success;
//     _statusCode = statusCode;
//     _message = message;
//     _data = data;
//   }

//   ProfileResponse.fromJson(dynamic json) {
//     _success = json['success'];
//     _statusCode = json['statusCode'];
//     _message = json['message'];
//     _data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }

//   bool? _success;
//   int? _statusCode;
//   String? _message;
//   Data? _data;

//   bool? get success => _success;

//   int? get statusCode => _statusCode;

//   String? get message => _message;

//   Data? get data => _data;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['success'] = _success;
//     map['statusCode'] = _statusCode;
//     map['message'] = _message;
//     if (_data != null) {
//       map['data'] = _data?.toJson();
//     }
//     return map;
//   }
// }

// /// id : 102
// /// city : null
// /// phone : "77089146990"
// /// name : null
// /// surname : null
// /// date : null
// /// iin : null
// /// role : "user"
// /// type : "hired"
// /// avatar : null
// /// token : null
// /// promocode : null
// /// actived : false
// /// phone_verified : "2022-02-15 18:53:46"
// /// created_at : "2022-02-15T12:53:46.000000Z"
// /// updated_at : "2022-02-15T12:54:07.000000Z"
// /// documents : null

// class Data {
//   Data({
//     int? id,
//     dynamic city,
//     String? phone,
//     dynamic name,
//     dynamic surname,
//     dynamic date,
//     dynamic iin,
//     String? role,
//     String? type,
//     dynamic avatar,
//     dynamic token,
//     dynamic promocode,
//     bool? actived,
//     String? phoneVerified,
//     String? createdAt,
//     String? updatedAt,
//     dynamic documents,
//   }) {
//     _id = id;
//     _city = city;
//     _phone = phone;
//     _name = name;
//     _surname = surname;
//     _date = date;
//     _iin = iin;
//     _role = role;
//     _type = type;
//     _avatar = avatar;
//     _token = token;
//     _promocode = promocode;
//     _actived = actived;
//     _phoneVerified = phoneVerified;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _documents = documents;
//   }

//   Data.fromJson(dynamic json) {
//     _id = json['id'];
//     _city = json['city'];
//     _phone = json['phone'];
//     _name = json['name'];
//     _surname = json['surname'];
//     _date = json['date'];
//     _iin = json['iin'];
//     _role = json['role'];
//     _type = json['type'];
//     _avatar = json['avatar'];
//     _token = json['token'];
//     _promocode = json['promocode'];
//     _actived = json['actived'];
//     _phoneVerified = json['phone_verified'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _documents = json['documents'];
//   }

//   int? _id;
//   dynamic _city;
//   String? _phone;
//   dynamic _name;
//   dynamic _surname;
//   dynamic _date;
//   dynamic _iin;
//   String? _role;
//   String? _type;
//   dynamic _avatar;
//   dynamic _token;
//   dynamic _promocode;
//   bool? _actived;
//   String? _phoneVerified;
//   String? _createdAt;
//   String? _updatedAt;
//   dynamic _documents;

//   int? get id => _id;

//   dynamic get city => _city;

//   String? get phone => _phone;

//   dynamic get name => _name;

//   dynamic get surname => _surname;

//   dynamic get date => _date;

//   dynamic get iin => _iin;

//   String? get role => _role;

//   String? get type => _type;

//   dynamic get avatar => _avatar;

//   dynamic get token => _token;

//   dynamic get promocode => _promocode;

//   bool? get actived => _actived;

//   String? get phoneVerified => _phoneVerified;

//   String? get createdAt => _createdAt;

//   String? get updatedAt => _updatedAt;

//   dynamic get documents => _documents;

//   bool get isNameFilled => _name != null && _surname != null;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['city'] = _city;
//     map['phone'] = _phone;
//     map['name'] = _name;
//     map['surname'] = _surname;
//     map['date'] = _date;
//     map['iin'] = _iin;
//     map['role'] = _role;
//     map['type'] = _type;
//     map['avatar'] = _avatar;
//     map['token'] = _token;
//     map['promocode'] = _promocode;
//     map['actived'] = _actived;
//     map['phone_verified'] = _phoneVerified;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['documents'] = _documents;
//     return map;
//   }
// }
