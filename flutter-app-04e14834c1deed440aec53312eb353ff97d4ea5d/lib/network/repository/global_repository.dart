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
import 'package:europharm_flutter/network/repository/hive_repository.dart';
import 'package:europharm_flutter/network/services/network_service.dart';
import 'package:europharm_flutter/screens/personal_data_screen/ui/widgets/_vmodel.dart';
import 'package:europharm_flutter/screens/user_confirmation/ui/_vmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalRepository {
  late final NetworkService _networkService;

  void init(NetworkService networkService, HiveRepository hiveRepository) {
    _networkService = networkService;
    // if(hiveRepository.getUserId().isNotEmpty) {
    //   try {
    //     analytics.setUserId(hiveRepository.getUserId());
    //   } catch (e) {
    //     print(e);
    //   }
    // }
  }

  Future<LoginResponse> login(String phone, String password) async =>
      _networkService.login(phone, password);

  Future<void> deleteAccount(int userId) async =>
      _networkService.deleteAccount(userId);

  Future<PhoneRegisterResponse> registerPhone(String phone) async =>
      _networkService.registerPhone(phone);

  Future<PhoneCodeRegisterResponse> registerPhoneCode(
    String phone,
    String code,
  ) async =>
      _networkService.registerPhoneCode(phone, code);

  Future<PhoneCodeRegisterResponse> registerConfirm(
    String password,
    String registerToken,
    String deviceOs,
    String deviceToken,
  ) async =>
      _networkService.registerConfirm(
        password,
        registerToken,
        deviceOs,
        deviceToken,
      );

  Future<UserDTO> getProfile() async => _networkService.getProfile();

  Future<CarsResponse> getCars() async => _networkService.getCars();

  Future<MarksResponse> getMarks() async => _networkService.getMarks();

  Future<CitiesResponse> getCities() async => _networkService.getCities();

  Future<List<OrderDTO>> acceptedOrders() async =>
      _networkService.acceptedOrders();

  Future<List<OrderDTO>> getOrdersByCities({
    String? cityId,
  }) async =>
      _networkService.getOrdersByCities(cityId: cityId);

  Future<void> verify(PersonalInfoVModel vModel) async =>
      _networkService.verify(vModel);

  Future<OrderDTO> acceptOrder(int orderId) async =>
      _networkService.acceptOrder(orderId);

  Future<List<PointDTO>> orderPoints(int orderId) async =>
      _networkService.orderPoints(orderId);

  Future<String> sendContainers(List<ContainerDTO> containers) async {
    return _networkService.sendContainers(containers);
  }

  Future<PointDTO> orderPointProducts(int pointId) async =>
      _networkService.orderPointProducts(pointId);

  Future<PointDTO> orderProductFinish(int productId, String code) async =>
      _networkService.orderProductFinish(productId, code);

  Future<PointDTO> orderPointFinish({
    required int pointId,
  }) async =>
      _networkService.orderPointFinish(pointId: pointId);

  Future<OrderDTO> stopOrder({
    required int orderId,
    required int pointId,
    required String cause,
    UserDTO? emptyDriver,
  }) async =>
      _networkService.stopOrder(
        orderId: orderId,
        pointId: pointId,
        cause: cause,
        emptyDriver: emptyDriver,
      );

  Future<OrderDTO> stopOrderAndChangeDriver({
    required int orderId,
    required String cause,
    UserDTO? emptyDriver,
  }) async =>
      _networkService.stopOrderAndChangeDriver(
        orderId: orderId,
        cause: cause,
        emptyDriver: emptyDriver,
      );

  Future<OrderDTO> resumeOrder(int orderId) async =>
      _networkService.resumeOrder(orderId);

  Future<OrderHistoryResponse> orderHistory(
    String startDate,
    String endDate,
  ) async =>
      _networkService.orderHistory(startDate, endDate);

  Future<PositionsResponse> getPositions() async =>
      _networkService.getPositions();

  Future<void> editProfile(
    PersonalDataVModel vModel,
  ) async =>
      _networkService.editProfile(vModel);

  // Future<void> sendDeviceToken(String deviceOs, String deviceToken) async =>
  //     await _networkService.sendDeviceToken(deviceOs, deviceToken);

  Future<void> sendDeviceToken(String deviceToken) async =>
      _networkService.sendDeviceToken(deviceToken: deviceToken);

  Future<void> logout() async => _networkService.logout();

  Future<List<NotificationDTO>> getNotifications() async =>
      _networkService.getNotifications();

  Future<List<UserDTO>> getEmptyDrivers() async =>
      _networkService.getEmptyDrivers();

  Future<List<PointDTO>> getPointsByDate({
    required String fromDate,
    required String toDate,
  }) async =>
      _networkService.getPointsByDate(
        fromDate: fromDate,
        toDate: toDate,
      );

  Future<OrderDTO> getOrderByOrderId({
    required int orderId,
  }) async =>
      _networkService.getOrderByOrderId(
        orderId: orderId,
      );

  Future<String> orderFinish({
    required int orderId,
  }) async =>
      _networkService.orderFinish(
        orderId: orderId,
      );

  Future<List<OrderDTO>> getOrdersByDate({
    required String startDate,
    required String endDate,
  }) async =>
      _networkService.getOrdersByDate(
        startDate: startDate,
        endDate: endDate,
      );

  Future<void> saveOtherReasonTimer({
    required int orderId,
  }) async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    _preferences.setString('$orderId OTHERTIME', DateTime.now().toString());
  }

  Future<String> getOtherReasonTimer({
    required int orderId,
  }) async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    return _preferences.getString('$orderId OTHERTIME') as String;
  }

  Future<List<OrderDocuments>> getOrderDocuments(
          {required int orderId, required int userId}) async =>
      _networkService.getOrderDocuments(orderId: orderId, userId: userId);

  Future<List<Repairs>> getRepairs() async => _networkService.getRepairs();
}
