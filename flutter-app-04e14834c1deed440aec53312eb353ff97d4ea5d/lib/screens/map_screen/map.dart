import 'dart:async';
import 'dart:math';
import 'dart:developer' as dev;

import 'package:europharm_flutter/network/models/order_dto.dart';
import 'package:europharm_flutter/network/models/point_dto.dart';
import 'package:europharm_flutter/screens/map_screen/data/bloc/map_cubit.dart';
import 'package:europharm_flutter/screens/map_screen/data/bloc/map_state.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/widgets/app_bottom_sheets/app_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

const _tag = 'SessionPage';

class SessionPage extends StatefulWidget {
  final int orderId;
  final OrderDTO order;
  final List<PointDTO> orderPoints;

  const SessionPage({
    Key? key,
    required this.orderId,
    required this.order,
    required this.orderPoints,
  }) : super(key: key);

  @override
  State<SessionPage> createState() => _SessionState();
}

class _SessionState extends State<SessionPage> {
  Completer<YandexMapController> completer = Completer();

  late final List<MapObject> mapObjects = [];
  final List<PlacemarkMapObject> placemarks = [];
  final List<RequestPoint> points = [];
  final List<DrivingSessionResult> results = [];
  Position? currentPos;

  Future<void> initMap() async {
    final Position pos = await _determinePosition();
    currentPos = pos;
    dev.log("CURRENT POS: ${pos.latitude} ${pos.longitude}");
    await updateMap(5, pos);

    placemarks.add(PlacemarkMapObject(
      mapId: MapObjectId('placeMark ${placemarks.length - 1}'),
      point: Point(
        latitude: pos.latitude, // data[i].lat as double,
        longitude: pos.longitude, // data[i].long as double,
      ),
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
            'assets/images/user.png',
          ),
        ),
      ),
    ));

    mapObjects.add(placemarks.last);
    points.add(
      RequestPoint(
        point: placemarks.last.point,
        requestPointType: RequestPointType.wayPoint,
      ),
    );
    setState(() {});
  }

  Future<void> updateMap(double zoom, Position position) async {
    final YandexMapController controller = await completer.future;
    await controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(latitude: position.latitude, longitude: position.longitude),
          zoom: zoom,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    dev.log('message');
    BlocProvider.of<MapCubit>(context).getMap(
      orderId: widget.orderId,
      orderPoints: widget.orderPoints,
      startPoint: widget.order.points?.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            //height: 300,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Scaffold(
              body: BlocConsumer<MapCubit, MapState>(
                listener: (context, state) {
                  if (state is MapLoadedState) {
                    _requestRoutes(state.loadedMap);
                    initMap();
                    dev.log('mapmapmap :::: ${state.loadedMap}');
                  }
                },
                builder: (context, state) {
                  if (state is MapLoadedState) {
                    // _requestRoutes(state.loadedMap);
                    return YandexMap(
                      onMapCreated: (YandexMapController yandexMapController) async {
                        completer.complete(yandexMapController);
                        initMap();
                        //final Position currentPos = await determinePosition();

                        if (state.loadedMap.isNotEmpty) {
                          final double? lat = double.tryParse(
                            state.loadedMap.first.lat!.toString(),
                          ); // FIXME
                          final double? long = double.tryParse(state.loadedMap.first.long!.toString());
                          if (lat != null && long != null) {
                            dev.log('YandexMap: 1');
                            yandexMapController.moveCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: Point(
                                    longitude: long,
                                    latitude: lat,
                                    // longitude: widget.orderData.fromLong!,
                                    // latitude: widget.orderData.fromLat!,
                                  ),
                                  zoom: 15,
                                ),
                              ),
                              animation: const MapAnimation(),
                            );
                          } else {
                            dev.log('YandexMap: 2');

                            yandexMapController.moveCamera(
                              CameraUpdate.newCameraPosition(
                                const CameraPosition(
                                  target: Point(
                                    longitude: 43.238949,
                                    latitude: 76.889709,
                                    // longitude: widget.orderData.fromLong!,
                                    // latitude: widget.orderData.fromLat!,
                                  ),
                                  zoom: 9,
                                ),
                              ),
                              animation: const MapAnimation(),
                            );
                          }
                        }
                      },
                      mapObjects: mapObjects,
                    );
                  }

                  if (state is MapInitState) {
                    if (kDebugMode) {
                      print('init');
                    }
                    return YandexMap(
                      mapObjects: mapObjects,
                    );
                  }

                  if (state is MapErrorState) {
                    return Center(
                      child: Text(
                        state.messsage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.indigoAccent,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 15,
            child: IconButton(
              onPressed: () async {
                currentPos = await _determinePosition();
                await updateMap(15, currentPos!);
              },
              icon: const Icon(
                Icons.my_location,
                size: 45,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _requestRoutes(List<PointDTO> data) async {
    if (data.isEmpty) return;
    if (data.length < 2) return;
    try {
      for (int i = 0; i < data.length; i++) {
        /// FIXME
        final double? lat = double.tryParse(data[i].lat.toString());
        final double? long = double.tryParse(data[i].long.toString());
        if (lat != null && long != null) {
          placemarks.add(
            PlacemarkMapObject(
              mapId: MapObjectId('placeMark $i'),
              point: Point(
                latitude: lat, // data[i].lat as double,
                longitude: long, // data[i].long as double,
              ),
              icon: PlacemarkIcon.single(
                PlacemarkIconStyle(
                  image: BitmapDescriptor.fromAssetImage(
                    'assets/images/${i == data.length - 2 ? "route_end" : i == 0 ? "route_start" : "route_stop_by"}.png',
                  ),
                ),
              ),
            ),
          );
        }
      }

      if (placemarks.length < 2) return;
      for (int i = 0; i < placemarks.length; i++) {
        mapObjects.add(placemarks[i]);
        points.add(
          RequestPoint(
            point: placemarks[i].point,
            requestPointType: RequestPointType.wayPoint,
          ),
        );
      }

      final DrivingSessionResult result = await YandexDriving.requestRoutes(
        points: points,
        drivingOptions: const DrivingOptions(
          initialAzimuth: 0,
          routesCount: 1,
          avoidTolls: false,
        ),
      ).result;

      dev.log('YandexDriving.requestRoutes response ::: ${result.error}', name: _tag);

      if (result.routes != null) {
        results.add(result);
        for (int i = 0; i < result.routes!.length; i++) {
          mapObjects.add(
            PolylineMapObject(
              mapId: MapObjectId('route_${i}_polyline'),
              polyline: Polyline(
                points: result.routes![i].geometry,
              ),
              // coordinates: result.routes![i].geometry,
              strokeColor: ColorPalette.blueColors[Random().nextInt(ColorPalette.blueColors.length)],
              strokeWidth: 3,
            ),
          );

          if (i == result.routes!.length - 1) {
            if (!mounted) return;
            final state = BlocProvider.of<MapCubit>(context);
            state.changeToMapInitState(); // state.emit(MapInitState());
          }
        }
      }
    } catch (e) {
      dev.log('_requestRoutes error ::: $e', name: _tag);
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.requestPermission();

      showAppDialog(context, body: "Включите геолокацию в настройках телефона");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
