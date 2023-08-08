import 'dart:async';
import 'dart:developer';

import 'package:europharm_flutter/network/models/dto_models/response/order_history_response.dart';
import 'package:europharm_flutter/utils/extensions/date_time_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../network/repository/global_repository.dart';

part 'events.dart';
part 'states.dart';
part 'parts/read.dart';

const _tag = 'BlocRideHistory';

class BlocRideHistory extends Bloc<EventBlocRideHistory, StateBlocRideHistory> {
  BlocRideHistory({
    required this.repository,
  }) : super(StateRideHistoryInitial()) {
    on<EventReadRideHistory>(_read);
  }

  final GlobalRepository repository;
  List<OrderHistoryData> ridesHistory = [];
}
