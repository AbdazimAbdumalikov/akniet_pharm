import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:europharm_flutter/network/dio_wrapper/dio_wrapper.dart';
import 'package:europharm_flutter/network/models/dto_models/response/cars_response.dart';
import 'package:europharm_flutter/network/models/dto_models/response/cities_response.dart';
import 'package:europharm_flutter/network/models/dto_models/response/login_response.dart';
import 'package:europharm_flutter/network/models/dto_models/response/marks_response.dart';
import 'package:europharm_flutter/network/models/dto_models/response/order_history_response.dart';
import 'package:europharm_flutter/network/models/dto_models/response/phone_code_register_response.dart';
import 'package:europharm_flutter/network/models/dto_models/response/phone_register_response.dart';
import 'package:europharm_flutter/network/models/dto_models/response/positions_response.dart';
import 'package:europharm_flutter/network/models/notification_dto.dart';
import 'package:europharm_flutter/network/models/order_documents.dart';
import 'package:europharm_flutter/network/models/order_dto.dart';
import 'package:europharm_flutter/network/models/point_dto.dart';
import 'package:europharm_flutter/network/models/repairs.dart';
import 'package:europharm_flutter/network/models/user_dto.dart';
import 'package:europharm_flutter/screens/personal_data_screen/ui/widgets/_vmodel.dart';
import 'package:europharm_flutter/screens/user_confirmation/ui/_vmodel.dart';
import 'package:flutter/foundation.dart';

const _networkService = 'NetworkService';

class NetworkService {
  late final DioWrapper _dioWrapper;
  // final SideDioWrapper _sideDioWrapper = SideDioWrapper();
  static const String constToken = '';

  void init(DioWrapper dioService) {
    _dioWrapper = dioService;
  }

  Future<PhoneRegisterResponse> registerPhone(String phone) async {
    final response = await _dioWrapper.sendRequest(
      formData: FormData.fromMap({
        "phone": phone,
      }),
      path: "register",
      method: NetworkMethod.post,
    );
    return PhoneRegisterResponse.fromJson(response.data);
  }

  Future<PhoneCodeRegisterResponse> registerPhoneCode(
    String phone,
    String code,
  ) async {
    final response = await _dioWrapper.sendRequest(
      formData: FormData.fromMap({
        "phone": phone,
        "code": code,
      }),
      path: "register-password",
      method: NetworkMethod.post,
    );
    return PhoneCodeRegisterResponse.fromJson(response.data);
  }

  Future<PhoneCodeRegisterResponse> registerConfirm(
    String password,
    String registerToken,
    String deviceOs,
    String deviceToken,
  ) async {
    _dioWrapper.tokensRepository.save(registerToken);
    final response = await _dioWrapper.sendRequest(
      formData: FormData.fromMap({
        "password": password,
      }),
      path: "register-confirm",
      method: NetworkMethod.post,
    );
    return PhoneCodeRegisterResponse.fromJson(response.data);
  }

  Future<LoginResponse> login(
    String phone,
    String password,
  ) async {
    final response = await _dioWrapper.sendRequest(
      formData: FormData.fromMap({
        "phone": phone,
        "password": password,
        'type': 'mobile',
      }),
      path: "login",
      method: NetworkMethod.post,
    );
    return LoginResponse.fromJson(response.data);
  }

  Future<void> deleteAccount(int userId) async {
    final response = await _dioWrapper.sendRequest(
      formData: FormData.fromMap({'type': 'mobile', 'userId': userId}),
      path: "delete-user",
      method: NetworkMethod.post,
    );

    if (response.statusCode == 200 && response.data['status'] == true) {
      return;
    } else {
      Exception(response.data['message'] ?? 'User data deletion error.');
    }
  }

  Future<void> sendDeviceToken({
    required String deviceToken,
  }) async {
    String? deviceOS;
    if (Platform.isIOS) {
      deviceOS = 'ios';
    } else {
      deviceOS = 'android';
    }
    final response = await _dioWrapper.sendRequest(
      formData: FormData.fromMap({
        "device_token": deviceToken,
        "device_os": deviceOS,
      }),
      path: "device",
      method: NetworkMethod.post,
    );

    log('$response', name: _networkService);
  }

  Future<UserDTO> getProfile() async {
    final response = await _dioWrapper.sendRequest(
      path: "profile",
      method: NetworkMethod.get,
    );

    log(
      '##### getProfile api:: ${response.statusCode}',
      name: _networkService,
    );

    return UserDTO.fromJson(response.data['data'] as Map<String, dynamic>);
    // return ProfileResponse.fromJson(response.data);
  }

  Future<PositionsResponse> getPositions() async {
    final response = await _dioWrapper.sendRequest(
      path: "positions",
      method: NetworkMethod.get,
    );
    return PositionsResponse.fromJson(response.data);
  }

  Future<CarsResponse> getCars() async {
    final response = await _dioWrapper.sendRequest(
      path: "cars",
      method: NetworkMethod.get,
    );
    return CarsResponse.fromJson(response.data);
  }

  Future<MarksResponse> getMarks() async {
    final response = await _dioWrapper.sendRequest(
      path: "marks",
      method: NetworkMethod.get,
    );
    return MarksResponse.fromJson(response.data);
  }

  Future<CitiesResponse> getCities() async {
    final response = await _dioWrapper.sendRequest(
      path: "cities",
      method: NetworkMethod.get,
    );
    return CitiesResponse.fromJson(response.data);
  }

  Future<List<OrderDTO>> getOrdersByCities({
    String? cityId,
  }) async {
    final response = await _dioWrapper.sendRequest(
      path: "orders",
      formData: FormData.fromMap({
        if (cityId != null) "city_id": cityId,
      }),
      method: NetworkMethod.post,
    );

    // return OrdersResponse.fromJson(response.data as Map<String, dynamic>);
    log(
      '##### getOrdersByCities api:: ${response.statusCode}',
      name: _networkService,
    );

    final List<OrderDTO> orders = await compute<List, List<OrderDTO>>(
      (List list) {
        return list
            .map((e) => OrderDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      },
      (response.data as Map<String, dynamic>)['data'] as List,
    );

    return orders;
  }

  Future<void> verify(PersonalInfoVModel vModel) async {
    await _dioWrapper.sendRequest(
      path: "verify",
      method: NetworkMethod.post,
      formData: FormData.fromMap(await vModel.toJson()),
    );
  }

  Future<OrderDTO> acceptOrder(int orderId) async {
    final response = await _dioWrapper.sendRequest(
      path: "/order/accept",
      method: NetworkMethod.post,
      formData: FormData.fromMap({
        "order_id": orderId,
      }),
    );
    log('#####acceptOrder api::: ${response.toString()}',
        name: _networkService);

    return OrderDTO.fromJson(
      (response.data as Map<String, dynamic>)["data"] as Map<String, dynamic>,
    );
  }

  // Future<void> sendDeviceToken(String deviceOs, String deviceToken) async { /// FIXME
  //   final response = await _dioWrapper.sendRequest(
  //       path: "/device",
  //       method: NetworkMethod.post,
  //       formData: FormData.fromMap({
  //         "device_token": deviceToken,
  //         "device_os": deviceOs,
  //       }));
  //   print(response);
  // }

  Future<OrderDTO> stopOrder({
    required int orderId,
    required int pointId,
    required String cause,
    UserDTO? emptyDriver,
  }) async {
    final response = await _dioWrapper.sendRequest(
      path: "/order/stop",
      method: NetworkMethod.post,
      formData: FormData.fromMap({
        "order_id": orderId,
        "point_id": pointId,
        "stop_reason": cause,
        if (emptyDriver != null) 'user_id': emptyDriver.id,
      }),
    );
    log('#####stopOrder api::: ${response.statusCode}', name: _networkService);
    return OrderDTO.fromJson(
      (response.data as Map<String, dynamic>)["data"] as Map<String, dynamic>,
    );
  }

  Future<OrderDTO> stopOrderAndChangeDriver({
    required int orderId,
    required String cause,
    UserDTO? emptyDriver,
  }) async {
    final response = await _dioWrapper.sendRequest(
      path: "order/change/user",
      method: NetworkMethod.post,
      formData: FormData.fromMap({
        "order_id": orderId,
        // "stop_reason": cause,
        if (emptyDriver != null) 'user_id': emptyDriver.id,
      }),
    );
    log('#####stopOrderAndChangeDriver api::: ${response.statusCode}',
        name: _networkService);
    return OrderDTO.fromJson(
      (response.data as Map<String, dynamic>)["data"] as Map<String, dynamic>,
    );
  }

  Future<OrderDTO> resumeOrder(
    int orderId,
  ) async {
    final response = await _dioWrapper.sendRequest(
      path: "order/resume",
      method: NetworkMethod.post,
      formData: FormData.fromMap({
        "order_id": orderId,
      }),
    );
    log(
      '#####resumeOrder api::: ${response.statusCode}',
      name: _networkService,
    );

    return OrderDTO.fromJson(
      (response.data as Map<String, dynamic>)["data"] as Map<String, dynamic>,
    );
  }

  Future<List<PointDTO>> orderPoints(int orderId) async {
    try {
      final response = await _dioWrapper.sendRequest(
        path: "/order/points",
        method: NetworkMethod.post,
        formData: FormData.fromMap(
          {
            "order_id": orderId,
          },
        ),
      );

      log(
        '##### orderPoints api:: ${response.statusCode}',
        name: _networkService,
      );

      final List<PointDTO> points = await compute<List, List<PointDTO>>(
        (List list) {
          return list
              .map((e) => PointDTO.fromJson(e as Map<String, dynamic>))
              .toList();
        },
        (response.data as Map<String, dynamic>)['data'] as List,
      );

      // log(points.toString(), name: _networkService);

      return points;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> sendContainers(
    List<ContainerDTO> containers,
  ) async {
    try {
      List<Map<String, dynamic>> temp = [];

      for (int i = 0; i < containers.length; i++) {
        if (containers[i].isScanned) {
          temp.add({
            'point_id': containers[i].pointId,
            'code': containers[i].code,
          });
        }
      }

      log('TEMP LENGTH:::: ${temp.length}');
      final response = await _dioWrapper.sendRequest(
        path: "/order/point/containers",
        method: NetworkMethod.post,
        request: {
          'containers': temp,
        },
      );
      log(
        '##### sendContainers api:: ${response.statusCode}',
        name: _networkService,
      );

      return (response.data as Map<String, dynamic>)["message"].toString();
    } catch (e) {
      log('MESSAGE::::: $e');
      throw Exception(e);
    }
  }

  Future<PointDTO> orderPointProducts(int pointId) async {
    final response = await _dioWrapper.sendRequest(
      path: "/order/point/products",
      method: NetworkMethod.post,
      formData: FormData.fromMap({
        "point_id": pointId,
      }),
    );
    log(
      '##### orderPointProducts api:: ${response.statusCode}',
      name: _networkService,
    );

    return PointDTO.fromJson(
      (response.data as Map<String, dynamic>)["data"] as Map<String, dynamic>,
    );
  }

  Future<PointDTO> orderProductFinish(int productId, String code) async {
    final response = await _dioWrapper.sendRequest(
      path: "/order/point/product/finish",
      method: NetworkMethod.post,
      formData: FormData.fromMap({
        "product_id": productId,
        "code": code,
      }),
    );
    return PointDTO.fromJson(
      (response.data as Map<String, dynamic>)["data"] as Map<String, dynamic>,
    );
  }

  Future<PointDTO> orderPointFinish({
    required int pointId,
  }) async {
    final Response<dynamic> response = await _dioWrapper.sendRequest(
      path: "point-finish",
      method: NetworkMethod.post,
      formData: FormData.fromMap({
        "point_id": pointId,
      }),
    );

    return PointDTO.fromJson(
      (response.data as Map<String, dynamic>)["data"] as Map<String, dynamic>,
    );
  }

  Future<List<OrderDTO>> acceptedOrders() async {
    final response = await _dioWrapper.sendRequest(
      path: "/orders/accepted",
      method: NetworkMethod.get,
    );

    // return OrdersResponse.fromJson(response.data as Map<String, dynamic>);
    log(
      '##### acceptedOrders api:: ${response.statusCode}',
      name: _networkService,
    );

    final List<OrderDTO> orders = await compute<List, List<OrderDTO>>(
      (List list) {
        return list
            .map((e) => OrderDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      },
      (response.data as Map<String, dynamic>)['data'] as List,
    );

    return orders;
  }

  Future<OrderHistoryResponse> orderHistory(
    String startDate,
    String endDate,
  ) async {
    try {
      final Response<dynamic> response = await _dioWrapper.sendRequest(
        path: "order/history",
        method: NetworkMethod.post,
        formData: FormData.fromMap({
          "start_date": startDate,
          "end_date": endDate,
        }),
      );
      return OrderHistoryResponse.fromJson(
          response.data as Map<String, dynamic>);
    } catch (e) {
      log('### orderHistory ::: $e', name: _networkService);
      throw Exception(e);
    }
  }

  Future<void> editProfile(
    PersonalDataVModel vModel,
  ) async {
    final response = await _dioWrapper.sendRequest(
      path: "profile-edit",
      method: NetworkMethod.post,
      formData: FormData.fromMap(await vModel.toJson()),
    );
    log(
      '#####editProfile api::: ${response.toString()}',
      name: _networkService,
    );
  }

  Future<void> logout() async {
    await _dioWrapper.sendRequest(
      path: "logout",
      method: NetworkMethod.post,
    );
  }

  Future<List<NotificationDTO>> getNotifications() async {
    final Response<dynamic> response = await _dioWrapper.sendRequest(
      path: 'notifications',
      method: NetworkMethod.get,
    );

    log(
      '##### getNotifications api:: ${response.statusCode}',
      name: _networkService,
    );

    final List<NotificationDTO> notifications =
        await compute<List, List<NotificationDTO>>(
      (List list) {
        return list
            .map((e) => NotificationDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      },
      (response.data as Map<String, dynamic>)['data'] as List,
    );

    // log(drivers.toString(), name: _networkService);

    return notifications;
  }

  Future<List<UserDTO>> getEmptyDrivers() async {
    final Response<dynamic> response = await _dioWrapper.sendRequest(
      path: 'empty-users',
      method: NetworkMethod.get,
    );
    log(
      '##### getEmptyDrivers api:: ${response.statusCode}',
      name: _networkService,
    );

    final List<UserDTO> drivers = await compute<List, List<UserDTO>>(
      (List list) {
        return list
            .map((e) => UserDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      },
      (response.data as Map<String, dynamic>)['data'] as List,
    );

    // log(drivers.toString(), name: _networkService);

    return drivers;
  }

  Future<List<PointDTO>> getPointsByDate({
    required String fromDate,
    required String toDate,
  }) async {
    final Response<dynamic> response = await _dioWrapper.sendRequest(
        path: 'getPointsByDate',
        method: NetworkMethod.get,
        queryParameters: {
          'from': fromDate,
          'to': toDate,
        });

    log(
      '##### getPointsByDate api:: ${response.statusCode}',
      name: _networkService,
    );

    final List<PointDTO> points = await compute<List, List<PointDTO>>(
      (List list) {
        return list
            .map((e) => PointDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      },
      (response.data as Map<String, dynamic>)['data'] as List,
    );

    // log(points.toString(), name: _networkService);

    return points;
  }

  Future<OrderDTO> getOrderByOrderId({
    required int orderId,
  }) async {
    final Response<dynamic> response = await _dioWrapper.sendRequest(
      path: 'order-by-id/$orderId',
      method: NetworkMethod.get,
      baseUrl: 'http://185.129.50.172/api/web/',
    );

    log(
      '##### getOrderByOrderId api:: ${response.statusCode}',
      name: _networkService,
    );

    return OrderDTO.fromJson((response.data as Map<String, dynamic>)['data']
            as Map<String, dynamic>)
        .copyWith(
      transport:
          (response.data as Map<String, dynamic>)['data']['transport'] != null
              ? TransportDTO.fromJson(
                  (response.data as Map<String, dynamic>)['data']['transport']
                      ['transport'] as Map<String, dynamic>,
                )
              : null,
    );

    // final OrderDTO order = await compute<Map<String, dynamic>, OrderDTO>(
    //   (Map<String, dynamic> mapp) async {
    //     return OrderDTO.fromJson(mapp).copyWith(
    //       transport: (response.data as Map<String, dynamic>)['data']
    //                   ['transport'] !=
    //               null
    //           ? TransportDTO.fromJson(
    //               (response.data as Map<String, dynamic>)['data']['transport']
    //                   ['transport'] as Map<String, dynamic>,
    //             )
    //           : null,
    //     );
    //   },
    //   (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
    // );

    // // log(points.toString(), name: _networkService);

    // return order;
  }

  Future<String> orderFinish({
    required int orderId,
  }) async {
    final Response<dynamic> response = await _dioWrapper.sendRequest(
      path: 'order/finish',
      method: NetworkMethod.post,
      formData: FormData.fromMap({
        "order_id": orderId,
      }), // baseUrl: 'http://185.129.50.172/api/web/',
    );

    log(
      '##### orderFinish api:: ${response.statusCode}',
      name: _networkService,
    );

    return (response.data as Map<String, dynamic>)['message'] as String;
  }

  Future<List<OrderDTO>> getOrdersByDate({
    required String startDate,
    required String endDate,
  }) async {
    final Response<dynamic> response = await _dioWrapper.sendRequest(
        path: 'points-by-date',
        method: NetworkMethod.get,
        queryParameters: {
          'from': startDate,
          'to': endDate,
        });

    log(
      '##### getOrdersByDate api:: ${response.statusCode}',
      name: _networkService,
    );

    final List<OrderDTO> orders = await compute<List, List<OrderDTO>>(
      (List list) {
        return list
            .map((e) => OrderDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      },
      (response.data as Map<String, dynamic>)['data'] as List,
    );

    return orders;
  }

  Future<List<OrderDocuments>> getOrderDocuments(
      {required int orderId, required int userId}) async {
    final response = await _dioWrapper.sendRequest(
      path: "docs?user_id=$userId&order_id=$orderId",
      method: NetworkMethod.get,
    );

    // return OrdersResponse.fromJson(response.data as Map<String, dynamic>);
    log(
      '##### getOrderDocuments api:: ${response.statusCode}',
      name: _networkService,
    );

    final List<OrderDocuments> documents = await compute<List, dynamic>(
      (List list) {
        return list
            .map((e) => OrderDocuments.fromJson(e as Map<String, dynamic>))
            .toList();
      },
      (response.data as List<dynamic>),
    );

    return documents;
  }

  Future<List<Repairs>> getRepairs() async {
    final response = await _dioWrapper.sendRequest(
      path: "repairs",
      method: NetworkMethod.get,
    );

    log(
      '##### getRepairs api:: ${response.statusCode}',
      name: _networkService,
    );

    final List<Repairs> repairs = await compute<List, dynamic>(
      (List list) {
        return list
            .map((e) => Repairs.fromJson(e as Map<String, dynamic>))
            .toList();
      },
      (response.data as Map<String, dynamic>)['data'] as List,
    );

    return repairs;
  }
}
