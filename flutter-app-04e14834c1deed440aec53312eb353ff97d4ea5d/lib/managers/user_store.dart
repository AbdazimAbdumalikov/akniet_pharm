import 'package:europharm_flutter/network/repository/hive_repository.dart';
import 'package:flutter/cupertino.dart';

class UserStore extends ChangeNotifier {
  late HiveRepository _hiveRepository;

  Future<void> init(HiveRepository hiveRepository) async {
    _hiveRepository = hiveRepository;
  }

}
