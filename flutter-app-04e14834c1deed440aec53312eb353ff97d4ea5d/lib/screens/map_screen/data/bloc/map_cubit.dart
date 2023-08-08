import 'dart:developer';

import 'package:europharm_flutter/network/models/point_dto.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo_map.dart';
import 'map_state.dart';

const _tag = 'MapCubit';

class MapCubit extends Cubit<MapState> {
  final MapRepository mapRepository;
  final GlobalRepository _repository;

  MapCubit({
    required this.mapRepository,
    required GlobalRepository repository,
  })  : _repository = repository,
        super(MapInitState());

  Future<void> getMap({
    required int orderId,
    required PointDTO? startPoint, // sklad
    required List<PointDTO> orderPoints,
  }) async {
    try {
      emit(MapLoadingState());

      if (orderPoints.isEmpty) {
        final List<PointDTO> result = await _repository.orderPoints(orderId);
        log('wasvdbbsdbsb $startPoint');
        if (startPoint != null) {
          if (result.first.id != startPoint.id) {
            result.insert(0, startPoint);
          }
          log('getMap1: ${result.length}', name: _tag);
        }

        emit(MapLoadedState(loadedMap: result));
      } else {
        // if (orderPoints.first.id == startPoint.id) {
        //   orderPoints.insert(0, startPoint);
        // }
        log('getMap2: ${orderPoints.length}', name: _tag);
        emit(MapLoadedState(loadedMap: orderPoints));
      }
    } catch (e) {
      log(e.toString(), name: _tag);
      emit(MapErrorState(messsage: e.toString()));
    }
  }

  Future<void> changeToMapInitState() async {
    emit(MapInitState());
  }

  @override
  void onChange(Change<MapState> change) {
    log('$change', name: _tag);
    super.onChange(change);
  }
}
