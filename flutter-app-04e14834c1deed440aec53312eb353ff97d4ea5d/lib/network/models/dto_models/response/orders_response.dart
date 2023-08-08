import 'dart:convert';

// OrdersResponse welcomeFromJson(String str) =>
//     OrdersResponse.fromJson(json.decode(str));

// class OrdersResponse {
//   OrdersResponse({
//     this.success,
//     this.statusCode,
//     this.message,
//     this.data,
//   });

//   final bool? success;
//   final int? statusCode;
//   final String? message;
//   final List<OrderData>? data;

//   factory OrdersResponse.fromJson(Map<String, dynamic> json) => OrdersResponse(
//         success: json["success"],
//         statusCode: json["statusCode"],
//         message: json["message"],
//         data: json["data"] == null
//             ? null
//             : List<OrderData>.from(
//                 json["data"].map((x) => OrderData.fromJson(x))),
//       );
// }

// class OrderData {
//   OrderData({
//     this.id,
//     this.description,
//     this.from,
//     this.to,
//     this.fromLat,
//     this.fromLong,
//     this.toLat,
//     this.toLong,
//     this.status,
//     this.employee,
//     this.startDate,
//     this.endDate,
//     this.payment,
//     this.fromCityId,
//     this.toCityId,
//     this.createdAt,
//     this.images,
//     this.points,
//     this.orderStatus,
//     this.countPoints,
//     this.transport,
//     this.user,
//     this.isCurrent = false,
//   });

//   final int? id;
//   final String? description;
//   final String? from;
//   final String? to;
//   final double? fromLat;
//   final double? fromLong;
//   final double? toLat;
//   final double? toLong;
//   String? status;
//   final Employee? employee;
//   final DateTime? startDate;
//   final DateTime? endDate;
//   final String? payment;
//   final CityId? fromCityId;
//   final CityId? toCityId;
//   final DateTime? createdAt;
//   final Images? images;
//   final List<OrderPoint>? points;
//   final OrderStatus? orderStatus;
//   final int? countPoints;
//   final dynamic transport;
//   final User? user;
//   bool isCurrent;

//   factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
//         id: json["id"],
//         description: json["description"],
//         from: json["from"],
//         to: json["to"],
//         fromLat: json["from_lat"],
//         fromLong: json["from_long"],
//         toLat: json["to_lat"],
//         toLong: json["to_long"],
//         status: json["status"],
//         employee: json["employee"] == null
//             ? null
//             : Employee.fromJson(json["employee"]),
//         startDate: json["start_date"] == null
//             ? null
//             : DateTime.parse(json["start_date"]),
//         endDate:
//             json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
//         payment: json["payment"],
//         fromCityId: json["from_city_id"] == null
//             ? null
//             : CityId.fromJson(json["from_city_id"]),
//         toCityId: json["to_city_id"] == null
//             ? null
//             : CityId.fromJson(json["to_city_id"]),
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         images: json["images"] == null ? null : Images.fromJson(json["images"]),
//         points: json["points"] == null
//             ? null
//             : List<OrderPoint>.from(
//                 json["points"].map((x) => OrderPoint.fromJson(x))),
//         countPoints: json["count_points"],
//         transport: json["transport"],
//         user: json["user"] == null ? null : User.fromJson(json["user"]),
//         orderStatus: json["order_status"] == null
//             ? null
//             : OrderStatus.fromJson(json["order_status"]),
//       );
// }

// class Employee {
//   Employee({
//     this.id,
//     this.cityId,
//     this.name,
//     this.surname,
//     this.organization,
//     this.fullName,
//     this.bin,
//     this.agreement,
//     this.token,
//     this.phone,
//     this.email,
//     this.password,
//     this.type,
//     this.createdAt,
//     this.updatedAt,
//   });

//   final int? id;
//   final int? cityId;
//   final String? name;
//   final dynamic surname;
//   final dynamic organization;
//   final dynamic fullName;
//   final dynamic bin;
//   final dynamic agreement;
//   final String? token;
//   final dynamic phone;
//   final String? email;
//   final String? password;
//   final String? type;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   factory Employee.fromJson(Map<String, dynamic> json) => Employee(
//         id: json["id"],
//         cityId: json["city_id"],
//         name: json["name"],
//         surname: json["surname"],
//         organization: json["organization"],
//         fullName: json["full_name"],
//         bin: json["bin"],
//         agreement: json["agreement"],
//         token: json["token"],
//         phone: json["phone"],
//         email: json["email"],
//         password: json["password"],
//         type: json["type"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );
// }

// class CityId {
//   CityId({
//     this.id,
//     this.name,
//     this.regionId,
//     this.createdAt,
//     this.updatedAt,
//   });

//   final int? id;
//   final String? name;
//   final int? regionId;
//   final dynamic createdAt;
//   final dynamic updatedAt;

//   factory CityId.fromJson(Map<String, dynamic> json) => CityId(
//         id: json["id"],
//         name: json["name"],
//         regionId: json["region_id"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );
// }

// class Images {
//   Images();

//   factory Images.fromJson(Map<String, dynamic> json) => Images();
// }

class OrderPoint {
  OrderPoint({
    this.id,
    this.name,
    this.address,
    this.status,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.products,
    this.countProducts,
    this.from,
    this.to,
    this.fromLat,
    this.lat,
    this.fromLong,
    this.long,
    this.toLat,
    this.toLong,
  });

  final int? id;
  final String? name;
  final String? address;
  String? status;
  final DateTime? date;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Product>? products;
  final int? countProducts;
  final String? from;
  final dynamic to;
  final dynamic fromLat;
  final dynamic fromLong;
  final dynamic toLat;
  final dynamic lat;
  final dynamic toLong;
  final dynamic long;

  factory OrderPoint.fromJson(Map<String, dynamic> json) => OrderPoint(
        id: json["id"] as int?,
        name: json["name"] as String?,
        address: json["address"] as String?,
        status: json["status"] as String?,
        date: json["date"] == null
            ? null
            : DateTime.parse(json["date"] as String),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"] as String),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"] as String),
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x)),
              ),
        countProducts: json["count_products"] as int?,
        from: json["from"] as String?,
        to: json["to"],
        fromLat: json["from_lat"],
        lat: json["lat"],
        fromLong: json["from_long"],
        long: json["long"],
        toLat: json["to_lat"],
        toLong: json["to_long"],
      );
}

class Product {
  Product({
    this.id,
    this.point,
    this.name,
    this.code,
    this.status,
    // this.createdAt,
    // this.updatedAt,
  });

  final int? id;
  final int? point;
  final String? name;
  final String? code;
  final String? status;
  // final dynamic createdAt;
  // final dynamic updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        point: json["point"],
        name: json["name"],
        code: json["code"],
        status: json["status"],
        // createdAt: json["created_at"],
        // updatedAt: json["updated_at"],
      );
}

// class OrderStatus {
//   OrderStatus({
//     this.id,
//     this.orderId,
//     this.userId,
//     this.status,
//     this.stopReason,
//     this.countSnack,
//     this.countRelax,
//     this.finishedStatus,
//     this.stopTimer,
//     this.createdAt,
//     this.updatedAt,
//   });

//   final int? id;
//   final int? orderId;
//   final int? userId;
//   final String? status;
//   final String? stopReason;
//   final int? countSnack;
//   final int? countRelax;
//   final dynamic finishedStatus;
//   final DateTime? stopTimer;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
//         id: json["id"],
//         orderId: json["order_id"],
//         userId: json["user_id"],
//         status: json["status"],
//         stopReason: json["stop_reason"],
//         countSnack: json["count_snack"],
//         countRelax: json["count_relax"],
//         finishedStatus: json["finished_status"],
//         stopTimer: json["stop_timer"] == null
//             ? null
//             : DateTime.parse(json["stop_timer"]),
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );
// }

// class User {
//   User({
//     this.id,
//     this.orderId,
//     this.userId,
//     this.status,
//     this.stopReason,
//     this.countSnack,
//     this.countRelax,
//     this.finishedStatus,
//     this.stopTimer,
//     this.createdAt,
//     this.updatedAt,
//   });

//   final int? id;
//   final int? orderId;
//   final int? userId;
//   final String? status;
//   final dynamic stopReason;
//   final int? countSnack;
//   final int? countRelax;
//   final dynamic finishedStatus;
//   final dynamic stopTimer;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         orderId: json["order_id"],
//         userId: json["user_id"],
//         status: json["status"],
//         stopReason: json["stop_reason"],
//         countSnack: json["count_snack"],
//         countRelax: json["count_relax"],
//         finishedStatus: json["finished_status"],
//         stopTimer: json["stop_timer"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );
// }
