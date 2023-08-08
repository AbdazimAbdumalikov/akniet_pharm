// import 'dart:async';
// import 'dart:math';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';

// import 'control_button.dart';
// import 'map_page.dart';

// class MapControlsPage extends MapPage {
//   const MapControlsPage() : super('Map controls example');

//   @override
//   Widget build(BuildContext context) {
//     return _MapControlsExample();
//   }
// }

// class _MapControlsExample extends StatefulWidget {
//   @override
//   _MapControlsExampleState createState() => _MapControlsExampleState();
// }

// class _MapControlsExampleState extends State<_MapControlsExample> {
//   late YandexMapController controller;
//   final List<MapObject> mapObjects = [];
//   final MapObjectId polylineId = const MapObjectId('polyline');
//   final MapObjectId polylineId2 = const MapObjectId('polyline2');

//   final MapObjectId targetMapObjectId = const MapObjectId('target_placemark');
//   static const Point _point = Point(latitude: 59.945933, longitude: 30.320045);
//   final animation =
//       const MapAnimation(type: MapAnimationType.smooth, duration: 2.0);
//   final Completer<YandexMapController> _completer = Completer();

//   bool tiltGesturesEnabled = true;
//   bool zoomGesturesEnabled = true;
//   bool rotateGesturesEnabled = true;
//   bool scrollGesturesEnabled = true;
//   bool modelsEnabled = true;
//   bool nightModeEnabled = false;
//   bool fastTapEnabled = false;
//   bool mode2DEnabled = false;
//   bool indoorEnabled = false;
//   bool liteModeEnabled = false;
//   ScreenRect? screenRect;

//   void _onMapCreated(YandexMapController controller) {
//     _completer.complete(controller);
//   }

//   @override
//   Widget build(BuildContext context) {
//     AndroidYandexMap.useAndroidViewSurface = true;
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Expanded(
//               child: YandexMap(
//             mapObjects: mapObjects,
//             onMapCreated: _onMapCreated,
//           )),
//           const SizedBox(height: 20),
//           Expanded(
//               child: SingleChildScrollView(
//                   child: Column(children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 ControlButton(
//                     onPressed: () async {
//                       if (mapObjects.any((el) => el.mapId == polylineId)) {
//                         return;
//                       }
//                       final polyline = PolylineMapObject(
//                           mapId: polylineId,
//                           polyline: const Polyline(
//                             points: <Point>[
//                               // Point(latitude: 82.445933, longitude: 53.329945),
//                               Point(latitude: 43.0, longitude: 77.0),
//                               Point(latitude: 47.0, longitude: 77.0),
//                               // Point(latitude: 46.32867, longitude: 64.00205),
//                               // Point(latitude: 47.67642, longitude: 56.80994),
//                               // Point(latitude: 49.823618, longitude: 66.823571),
//                               // Point(latitude: 40.15328, longitude: 51.95205),
//                               // Point(latitude: 46.8519, longitude: 55.6122),
//                               // Point(latitude: 44.74306, longitude: 63.96779),
//                               // Point(latitude: 45.78874, longitude: 63.12214),
//                               // Point(latitude: 48.59665, longitude: 65.66007),
//                               // Point(latitude: 40.44498, longitude: 50.9968),
//                               // Point(latitude: 43.206777, longitude: 59.750022),
//                               // Point(latitude: 47.15222, longitude: 65.52722),
//                               // Point(latitude: 41.25, longitude: 68.41667),
//                               // Point(latitude: 45.0415, longitude: 70.9346),
//                               // Point(latitude: 46.42989, longitude: 75.4021),
//                             ],
//                           ),
//                           // coordinates:
//                           strokeColor: Colors.blue,
//                           strokeWidth: 2,
//                           // default value 5.0, this will be a little bold
//                           outlineColor: Colors.blue[200]!,
//                           outlineWidth: 5,
//                           onTap: (Polyline self, Point point) {
//                             if (kDebugMode) {
//                               print('Tapped me at $point');
//                             }
//                           });
//                       final polyline2 = Polyline(
//                           mapId: polylineId2,
//                           coordinates: const <Point>[
//                             // Point(latitude: 82.445933, longitude: 53.329945),
//                             Point(latitude: 47.0, longitude: 77.0),
//                             Point(latitude: 53.0, longitude: 77.0),
//                           ],
//                           strokeColor: Colors.black,
//                           strokeWidth: 5,
//                           // default value 5.0, this will be a little bold
//                           outlineColor: Colors.green[200]!,
//                           outlineWidth: 1.0,
//                           onTap: (Polyline self, Point point) {
//                             if (kDebugMode) {
//                               print('Tapped me at $point');
//                             }
//                           });

//                       setState(() {
//                         mapObjects.add(polyline);
//                         mapObjects.add(polyline2);
//                       });
//                     },
//                     title: 'Add'),
//                 ControlButton(
//                     onPressed: () async {
//                       if (!mapObjects.any((el) => el.mapId == polylineId)) {
//                         return;
//                       }

//                       final polyline =
//                           mapObjects.firstWhere((el) => el.mapId == polylineId)
//                               as Polyline;

//                       setState(() {
//                         mapObjects[mapObjects.indexOf(polyline)] =
//                             polyline.copyWith(
//                                 strokeColor: Colors.primaries[
//                                     Random().nextInt(Colors.primaries.length)],
//                                 strokeWidth: 8.5);
//                       });
//                     },
//                     title: 'Update'),
//                 ControlButton(
//                     onPressed: () async {
//                       setState(() {
//                         mapObjects.removeWhere((el) => el.mapId == polylineId);
//                       });
//                     },
//                     title: 'Remove'),
//               ],
//             )
//           ])))
//         ]);
//   }
// }
