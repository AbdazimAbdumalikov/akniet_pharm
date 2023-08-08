class OrderHistoryResponse {
  OrderHistoryResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? success;
  final int? statusCode;
  final String? message;
  final List<OrderHistoryData>? data;

  factory OrderHistoryResponse.fromJson(Map<String?, dynamic> json) =>
      OrderHistoryResponse(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<OrderHistoryData>.from(
                json["data"].map((x) => OrderHistoryData.fromJson(x))),
      );
}

class OrderHistoryData {
  OrderHistoryData({
    this.orderStatus,
    this.orderTransport,
    this.id,
    this.order,
    this.user,
    this.status,
    this.createdAt,
    this.updatedAt,
  }) : showTime = false;

  final int? id;
  final String? order;
  final String? orderStatus;
  final User? user;
  final OrderHistoryTransport? orderTransport;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  bool showTime;

  factory OrderHistoryData.fromJson(Map<String?, dynamic> json) =>
      OrderHistoryData(
        id: json["id"],
        orderTransport: json["order_transport"] == null? null:OrderHistoryTransport.fromJson(json["order_transport"]),
        order: json["order"]
            as String?, // == null ? null : Order.fromJson(json["order"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        status: json["status"],
           orderStatus: json["order_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class OrderHistoryTransport {
  OrderHistoryTransport({
    this.number,
    this.name,
    this.id,
  });

  final int? id;
  final String? number;
  final String? name;

  factory OrderHistoryTransport.fromJson(Map<String?, dynamic> json) => OrderHistoryTransport(
        id: json["id"],
        name: json["name"],
        number: json["number"],
      );
}

class Order {
  Order({
    this.id,
    this.description,
    this.from,
    this.to,
    this.fromLat,
    this.fromLong,
    this.toLat,
    this.toLong,
    this.status,
    this.employee,
    this.startDate,
    this.endDate,
    this.payment,
    this.fromCityId,
    this.toCityId,
    this.createdAt,
    this.images,
    this.points,
    this.countPoints,
    this.transport,
  });

  final int? id;
  final String? description;
  final String? from;
  final String? to;
  final int? fromLat;
  final int? fromLong;
  final int? toLat;
  final int? toLong;
  final String? status;
  final Employee? employee;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? payment;
  final CityId? fromCityId;
  final CityId? toCityId;
  final DateTime? createdAt;
  final Images? images;
  final List<Point>? points;
  final int? countPoints;
  final OrderTransport? transport;

  factory Order.fromJson(Map<String?, dynamic> json) => Order(
        id: json["id"],
        description: json["description"],
        from: json["from"],
        to: json["to"],
        fromLat: json["from_lat"],
        fromLong: json["from_long"],
        toLat: json["to_lat"],
        toLong: json["to_long"],
        status: json["status"],
        employee: json["employee"] == null
            ? null
            : Employee.fromJson(json["employee"]),
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        payment: json["payment"],
        fromCityId: json["from_city_id"] == null
            ? null
            : CityId.fromJson(json["from_city_id"]),
        toCityId: json["to_city_id"] == null
            ? null
            : CityId.fromJson(json["to_city_id"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        points: json["point?s"] == null
            ? null
            : List<Point>.from(json["points"].map((x) => Point.fromJson(x))),
        countPoints: json["count_point?s"],
        transport: json["transport"] == null
            ? null
            : OrderTransport.fromJson(json["transport"]),
      );
}

class Employee {
  Employee({
    this.id,
    this.cityId,
    this.name,
    this.surname,
    this.token,
    this.phone,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? cityId;
  final String? name;
  final String? surname;
  final String? token;
  final String? phone;
  final String? email;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Employee.fromJson(Map<String?, dynamic> json) => Employee(
        id: json["id"],
        cityId: json["city_id"],
        name: json["name"],
        surname: json["surname"],
        token: json["token"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class CityId {
  CityId({
    this.id,
    this.name,
    this.countryId,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final int? countryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CityId.fromJson(Map<String?, dynamic> json) => CityId(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class Images {
  Images();

  factory Images.fromJson(Map<String?, dynamic> json) => Images();

  Map<String?, dynamic> toJson() => {};
}

class Point {
  Point({
    this.id,
    this.name,
    this.address,
    this.status,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.products,
    this.countProducts,
  });

  final int? id;
  final String? name;
  final String? address;
  final String? status;
  final DateTime? date;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Product>? products;
  final int? countProducts;

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        status: json["status"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        countProducts: json["count_products"],
      );
}

class Product {
  Product({
    this.id,
    this.point,
    this.name,
    this.code,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? point;
  final String? name;
  final String? code;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Product.fromJson(Map<String?, dynamic> json) => Product(
        id: json["id"],
        point: json["point"],
        name: json["name"],
        code: json["code"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class OrderTransport {
  OrderTransport({
    this.number,
    this.name,
    this.id,
    this.orderId,
    this.transport,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? orderId;
  final TransportTransport? transport;
  final String? number;
  final String? name;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory OrderTransport.fromJson(Map<String?, dynamic> json) => OrderTransport(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        orderId: json["order_id"],
        transport: json["transport"] == null
            ? null
            : TransportTransport.fromJson(json["transport"]),
        type: json["type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class TransportTransport {
  TransportTransport({
    this.id,
    this.model,
    this.carDate,
    this.dimensions,
    this.number,
    this.registration,
    this.image,
  });

  final int? id;
  final Model? model;
  final DateTime? carDate;
  final String? dimensions;
  final String? number;
  final String? registration;
  final String? image;

  factory TransportTransport.fromJson(Map<String?, dynamic> json) =>
      TransportTransport(
        id: json["id"],
        model: json["model"] == null ? null : Model.fromJson(json["model"]),
        carDate:
            json["car_date"] == null ? null : DateTime.parse(json["car_date"]),
        dimensions: json["dimensions"],
        number: json["number"],
        registration: json["registration"],
        image: json["image"],
      );
}

class Model {
  Model({
    this.id,
    this.markId,
    this.name,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? markId;
  final String? name;
  final dynamic icon;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Model.fromJson(Map<String?, dynamic> json) => Model(
        id: json["id"],
        markId: json["mark_id"],
        name: json["name"],
        icon: json["icon"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class User {
  User({
    this.id,
    this.city,
    this.phone,
    this.name,
    this.surname,
    this.date,
    this.iin,
    this.role,
    this.type,
    this.avatar,
    this.token,
    this.promocode,
    this.actived,
    this.phoneVerified,
    this.createdAt,
    this.updatedAt,
    this.documents,
    this.transport,
  });

  final int? id;
  final dynamic city;
  final String? phone;
  final String? name;
  final String? surname;
  final DateTime? date;
  final String? iin;
  final String? role;
  final String? type;
  final dynamic avatar;
  final dynamic token;
  final dynamic promocode;
  final bool? actived;
  final DateTime? phoneVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Documents? documents;
  final TransportTransport? transport;

  factory User.fromJson(Map<String?, dynamic> json) => User(
        id: json["id"],
        city: json["city"],
        phone: json["phone"],
        name: json["name"],
        surname: json["surname"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        iin: json["iin"],
        role: json["role"],
        type: json["type"],
        avatar: json["avatar"],
        token: json["token"],
        promocode: json["promocode"],
        actived: json["actived"],
        phoneVerified: json["phone_verified"] == null
            ? null
            : DateTime.parse(json["phone_verified"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        documents: json["documents"] == null
            ? null
            : Documents.fromJson(json["documents"]),
        transport: json["transport"] == null
            ? null
            : TransportTransport.fromJson(json["transport"]),
      );
}

class Documents {
  Documents({
    this.id,
    this.docNumber,
    this.deadline,
    this.image1,
    this.image2,
    this.personImage,
  });

  final int? id;
  final String? docNumber;
  final DateTime? deadline;
  final String? image1;
  final String? image2;
  final String? personImage;

  factory Documents.fromJson(Map<String?, dynamic> json) => Documents(
        id: json["id"],
        docNumber: json["doc_number"],
        deadline:
            json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
        image1: json["image_1"],
        image2: json["image_2"],
        personImage: json["person_image"],
      );
}
