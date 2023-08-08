import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'map_model.dart';
import 'package:http/http.dart' as http;

class MapRepository {
  Future<MapModel> _getMap(int orderId) async {
    final response = await http.post(
      Uri.parse('http://185.129.50.172/api/v1/order/points'),
      headers: {
        "Authorization": "Bearer 25|3mRWQjYC5b3HuEUXzdRytobCATK52iggJjaMuUlh"
      },
      body: {
        // 'order_id': orderId.toString(),
        'order_id': "5",
      },
    );

    if (kDebugMode) {
      print('ok');
    }

    if (response.statusCode == 200) {
      final MapModel map = MapModel.fromJson(jsonDecode(response.body));

      if (kDebugMode) {
        print('okey');
      }
      return map;
    } else {
      throw Exception('Error fetching banners');
    }
  }

  Future<MapModel> getMap(int orderId) => _getMap(orderId);
}
