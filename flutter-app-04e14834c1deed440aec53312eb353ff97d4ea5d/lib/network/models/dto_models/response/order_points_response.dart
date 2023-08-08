// import 'package:europharm_flutter/network/models/dto_models/response/orders_response.dart';

// class OrderPointsResponse {
//   OrderPointsResponse({
//       this.success, 
//       this.statusCode, 
//       this.message, 
//       this.data,});

//   OrderPointsResponse.fromJson(dynamic json) {
//     success = json['success'];
//     statusCode = json['statusCode'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data?.add(OrderPoint.fromJson(v));
//       });
//     }
//   }
//   bool? success;
//   int? statusCode;
//   String? message;
//   List<OrderPoint>? data;

// }