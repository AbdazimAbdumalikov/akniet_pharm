// import 'package:camera/camera.dart';
// import 'package:europharm_flutter/generated/l10n.dart';
// import 'package:europharm_flutter/styles/color_palette.dart';
// import 'package:europharm_flutter/styles/text_styles.dart';
// import 'package:europharm_flutter/widgets/camera/camera_shape.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:logger/logger.dart';

// class IdVerificationScreen extends StatefulWidget {
//   const IdVerificationScreen({Key? key}) : super(key: key);

//   @override
//   State<IdVerificationScreen> createState() {
//     return _IdVerificationScreenState();
//   }
// }

// void logError(String code, String? message) {
//   if (message != null) {
//     if (kDebugMode) {
//       print('Error: $code\nError Message: $message');
//     }
//   } else {
//     if (kDebugMode) {
//       print('Error: $code');
//     }
//   }
// }

// class _IdVerificationScreenState extends State<IdVerificationScreen>
//     with WidgetsBindingObserver, TickerProviderStateMixin {
//   CameraController? controller;
//   bool isFlashlightEnabled = false;
//   bool isCameraInitialized = false;
//   XFile? imageFile;
//   bool enableAudio = true;
//   double _minAvailableExposureOffset = 0.0;
//   double _maxAvailableExposureOffset = 0.0;
//   late AnimationController _flashModeControlRowAnimationController;
//   late Animation<double> _flashModeControlRowAnimation;
//   late AnimationController _exposureModeControlRowAnimationController;
//   late Animation<double> _exposureModeControlRowAnimation;
//   late AnimationController _focusModeControlRowAnimationController;
//   late Animation<double> _focusModeControlRowAnimation;
//   double _minAvailableZoom = 1.0;
//   double _maxAvailableZoom = 1.0;
//   double _currentScale = 1.0;
//   double _baseScale = 1.0;
//   int _pointers = 0;
//   bool isBackSide = false;
//   List<String> images = [];
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       initCamera();
//     });

//     _ambiguate(WidgetsBinding.instance)?.addObserver(this);

//     _flashModeControlRowAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _flashModeControlRowAnimation = CurvedAnimation(
//       parent: _flashModeControlRowAnimationController,
//       curve: Curves.easeInCubic,
//     );
//     _exposureModeControlRowAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _exposureModeControlRowAnimation = CurvedAnimation(
//       parent: _exposureModeControlRowAnimationController,
//       curve: Curves.easeInCubic,
//     );
//     _focusModeControlRowAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _focusModeControlRowAnimation = CurvedAnimation(
//       parent: _focusModeControlRowAnimationController,
//       curve: Curves.easeInCubic,
//     );
//   }

//   void initCamera() async {
//     controller = CameraController(
//       const CameraDescription(
//         name: "0",
//         lensDirection: CameraLensDirection.back,
//         sensorOrientation: 90,
//       ),
//       ResolutionPreset.medium,
//       imageFormatGroup: ImageFormatGroup.jpeg,
//     );
//     Logger().i("|||||CAMERA is initialized id_verification|||");

//     var cameras = await availableCameras();
//     debugPrint("|||||CAMERA is initialized id_verification 2");

//     controller = CameraController(cameras[0], ResolutionPreset.max);
//     // controller!.initialize().then((_) {
//     //   if (!mounted) {
//     //     return;
//     //   }
//     //   setState(() {});
//     // });
//     debugPrint("|||||CAMERA is initialized id_verification 3");

//     await controller!.initialize();
//     await controller!
//         .getMinExposureOffset()
//         .then((value) => _minAvailableExposureOffset = value);
//     await controller!
//         .getMaxExposureOffset()
//         .then((value) => _maxAvailableExposureOffset = value);
//     await controller!
//         .getMaxZoomLevel()
//         .then((value) => _maxAvailableZoom = value);
//     debugPrint("camera is initialized id_verification");

//     await controller!
//         .getMinZoomLevel()
//         .then((value) => _minAvailableZoom = value);
//     setState(() {
//       isCameraInitialized = true;
//       debugPrint("|||||CAMERA is initialized id_verification 4");
//     });
//   }

//   @override
//   void dispose() {
//     _ambiguate(WidgetsBinding.instance)?.removeObserver(this);
//     _flashModeControlRowAnimationController.dispose();
//     _exposureModeControlRowAnimationController.dispose();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final CameraController? cameraController = controller;

//     // App state changed before we got the chance to initialize.
//     if (cameraController == null || !cameraController.value.isInitialized) {
//       return;
//     }

//     if (state == AppLifecycleState.inactive) {
//       cameraController.dispose();
//     } else if (state == AppLifecycleState.resumed) {
//       onNewCameraSelected(cameraController.description);
//     }
//   }

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: Stack(
//         children: [
//           Positioned(
//               top: 0,
//               bottom: 0,
//               right: 0,
//               left: 0,
//               child: _cameraPreviewWidget()),
//           Container(
//             alignment: Alignment.center,
//             decoration: ShapeDecoration(
//               shape: CameraShaper(
//                 paintWidth: MediaQuery.of(context).size.width - 20,
//                 paintHeight: 250,
//               ),
//             ),
//           ),
//           Positioned(
//               top: 210,
//               left: 18,
//               right: 18,
//               child: RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(children: [
//                   TextSpan(
//                     text: S.of(context).make_rights_photo,
//                     style: ProjectTextStyles.ui_16Medium.copyWith(
//                       color: ColorPalette.white,
//                     ),
//                   ),
//                   TextSpan(
//                     text: isBackSide
//                         ? S.of(context).from_back_side
//                         : S.of(context).from_facial_side,
//                     style: ProjectTextStyles.ui_16Medium.copyWith(
//                       color: ColorPalette.main,
//                     ),
//                   ),
//                 ]),
//               )),
//           Positioned(
//             bottom: 100,
//             left: 10,
//             right: 10,
//             child: GestureDetector(
//               onTap: () async {
//                 // onTakePictureButtonPressed();

//                 await takePicture().then((XFile? file) {
//                   if (mounted) {
//                     setState(() {
//                       if (file != null) {
//                         images.add(file.path);
//                       }
//                       if (isBackSide) {
//                         Navigator.of(context).pop(images);
//                       } else {
//                         isBackSide = !isBackSide;
//                       }
//                     });
//                   }
//                 });
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 16,
//                   horizontal: 18,
//                 ),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF306CDC),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SvgPicture.asset("assets/images/svg/make_photo.svg"),
//                     Text(
//                       S.of(context).photograph,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 70,
//             right: 10,
//             left: 10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                     },
//                     child:
//                         SvgPicture.asset("assets/images/svg/arrow_back.svg")),
//                 Text(
//                   S.of(context).photo,
//                   style: ProjectTextStyles.ui_20Medium.copyWith(
//                     color: ColorPalette.white,
//                   ),
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       controller!.setFlashMode(
//                         isFlashlightEnabled ? FlashMode.off : FlashMode.torch,
//                       );
//                       setState(() {
//                         isFlashlightEnabled = !isFlashlightEnabled;
//                       });
//                     },
//                     child:
//                         SvgPicture.asset("assets/images/svg/flashlight.svg")),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _cameraPreviewWidget() {
//     if (!isCameraInitialized) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     } else {
//       return Listener(
//         onPointerDown: (_) => _pointers++,
//         onPointerUp: (_) => _pointers--,
//         child: CameraPreview(
//           controller!,
//           child: LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//             return GestureDetector(
//               behavior: HitTestBehavior.opaque,
//               onScaleStart: _handleScaleStart,
//               onScaleUpdate: _handleScaleUpdate,
//               onTapDown: (details) => onViewFinderTap(details, constraints),
//             );
//           }),
//         ),
//       );
//     }
//   }

//   void _handleScaleStart(ScaleStartDetails details) {
//     _baseScale = _currentScale;
//   }

//   Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
//     if (controller == null || _pointers != 2) {
//       return;
//     }

//     _currentScale = (_baseScale * details.scale)
//         .clamp(_minAvailableZoom, _maxAvailableZoom);

//     await controller!.setZoomLevel(_currentScale);
//   }

//   void showInSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }

//   void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
//     if (controller == null) {
//       return;
//     }

//     // final CameraController cameraController = controller!;

//     // final offset = Offset(
//     //   details.localPosition.dx / constraints.maxWidth,
//     //   details.localPosition.dy / constraints.maxHeight,
//     // );
//     // cameraController.setExposurePoint(offset);
//     // cameraController.setFocusPoint(offset);
//   }

//   void onNewCameraSelected(CameraDescription cameraDescription) async {
//     if (controller != null) {
//       await controller!.dispose();
//     }

//     final CameraController cameraController = CameraController(
//       cameraDescription,
//       kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
//       enableAudio: enableAudio,
//       imageFormatGroup: ImageFormatGroup.jpeg,
//     );

//     controller = cameraController;

//     // If the controller is updated then update the UI.
//     cameraController.addListener(() {
//       if (mounted) setState(() {});
//       if (cameraController.value.hasError) {
//         showInSnackBar(
//             'Camera error ${cameraController.value.errorDescription}');
//       }
//     });

//     try {
//       await cameraController.initialize();
//       await Future.wait([
//         // The exposure mode is currently not supported on the web.
//         ...(!kIsWeb
//             ? [
//                 cameraController
//                     .getMinExposureOffset()
//                     .then((value) => _minAvailableExposureOffset = value),
//                 cameraController
//                     .getMaxExposureOffset()
//                     .then((value) => _maxAvailableExposureOffset = value)
//               ]
//             : []),
//         cameraController
//             .getMaxZoomLevel()
//             .then((value) => _maxAvailableZoom = value),
//         cameraController
//             .getMinZoomLevel()
//             .then((value) => _minAvailableZoom = value),
//       ]);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//     }

//     if (mounted) {
//       setState(() {});
//     }
//   }

//   void onTakePictureButtonPressed() {
//     takePicture().then((XFile? file) {
//       if (mounted) {
//         setState(() {
//           imageFile = file;
//         });
//         // if (file != null) showInSnackBar('Picture saved to ${file.path}');
//       }
//     });
//   }

//   Future<XFile?> takePicture() async {
//     final CameraController? cameraController = controller;
//     if (cameraController == null || !cameraController.value.isInitialized) {
//       showInSnackBar('Error: select a camera first.');
//       return null;
//     }

//     if (cameraController.value.isTakingPicture) {
//       // A capture is already pending, do nothing.
//       return null;
//     }

//     try {
//       Logger().d("message");
//       XFile file = await cameraController.takePicture();
//       Logger().e("|||||||||||||||| camera TAKE PICTURE");
//       return file;
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       Logger().e(e);
//       return null;
//     }
//   }

//   void _showCameraException(CameraException e) {
//     logError(e.code, e.description);
//     showInSnackBar('Error: ${e.code}\n${e.description}');
//   }
// }

// T? _ambiguate<T>(T? value) => value;
