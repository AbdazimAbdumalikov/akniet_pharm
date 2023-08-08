import 'package:europharm_flutter/network/models/point_dto.dart';

abstract class MapState {}

class MapInitState extends MapState {}

class MapLoadingState extends MapState {}

class MapLoadedState extends MapState {
  List<PointDTO> loadedMap;
  MapLoadedState({required this.loadedMap});
}

class MapErrorState extends MapState {
  String messsage;
  MapErrorState({required this.messsage});
}

class MapLostConnectState extends MapState {}
