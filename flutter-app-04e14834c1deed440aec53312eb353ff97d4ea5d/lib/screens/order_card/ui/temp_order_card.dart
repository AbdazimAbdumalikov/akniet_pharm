// import 'dart:developer';

// import 'package:another_xlider/another_xlider.dart';
// import 'package:europharm_flutter/generated/l10n.dart';
// import 'package:europharm_flutter/network/models/dto_models/response/orders_response.dart';
// import 'package:europharm_flutter/network/repository/global_repository.dart';
// import 'package:europharm_flutter/screens/map_screen/data/bloc/map_cubit.dart';
// import 'package:europharm_flutter/screens/map_screen/data/repo_map.dart';
// import 'package:europharm_flutter/screens/map_screen/map.dart';
// import 'package:europharm_flutter/screens/order_card/bloc/bloc_order_card.dart';
// import 'package:europharm_flutter/screens/order_card/bloc/empty_drivers_cubit.dart';
// import 'package:europharm_flutter/screens/order_card/ui/cause_bottom_sheet.dart';
// import 'package:europharm_flutter/screens/order_card/ui/widgets/employer_card_widget.dart';
// import 'package:europharm_flutter/screens/order_card/ui/widgets/timer.dart';
// import 'package:europharm_flutter/screens/order_card/ui/widgets/transfer_order_bottom_sheet.dart';
// import 'package:europharm_flutter/screens/order_finish/bloc/bloc_order_finish.dart';
// import 'package:europharm_flutter/screens/order_finish/ui/order_finish.dart';
// import 'package:europharm_flutter/styles/color_palette.dart';
// import 'package:europharm_flutter/styles/text_styles.dart';
// import 'package:europharm_flutter/utils/app_router.dart';
// import 'package:europharm_flutter/widgets/app_bottom_sheets/app_bottom_sheet.dart';
// import 'package:europharm_flutter/widgets/app_bottom_sheets/app_dialog.dart';
// import 'package:europharm_flutter/widgets/app_loader_overlay.dart';
// import 'package:europharm_flutter/widgets/main_button/main_button.dart';
// import 'package:europharm_flutter/widgets/main_text_field/app_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';

// class OrderCard extends StatefulWidget {
//   final OrderData order;

//   const OrderCard({Key? key, required this.order}) : super(key: key);

//   @override
//   State<OrderCard> createState() => _OrderCardState();
// }

// class _OrderCardState extends State<OrderCard> {
//   double _lowerValue = 0;
//   OrderPoint? point;
//   bool isScan = false;

//   @override
//   void initState() {
//     BlocProvider.of<EmptyDriversCubit>(context).getEmptyDrivers();
//     super.initState();
//     int count = 0;
//     try {
//       for (final element in widget.order.points!) {
//         if (element.status == "finished") {
//           count++;
//         }
//       }
//       _lowerValue = count * 100 / widget.order.points!.length;
//     } catch (e) {
//       _lowerValue = 0;
//     }
//     if (_lowerValue is! int) {
//       _lowerValue = 0;
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppLoaderOverlay(
//       child: BlocProvider<BlocOrderCard>(
//         create: (context) => BlocOrderCard(
//           repository: context.read<GlobalRepository>(),
//           orderDetails: widget.order,
//         )..add(EventInitialOrderCard(widget.order.id!)),
//         child: Scaffold(
//           backgroundColor: ColorPalette.white,
//           appBar: AppBar(
//             centerTitle: true,
//             title: Text(
//               "#0000000${widget.order.id}",
//               style: const TextStyle(
//                 color: Colors.black,
//               ),
//             ),
//             elevation: 0,
//             leading: IconButton(
//               icon: SvgPicture.asset(
//                 "assets/images/svg/arrow_back.svg",
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 Navigator.of(context, rootNavigator: true).pop();
//               },
//             ),
//           ),
//           floatingActionButton: BlocBuilder<BlocOrderCard, StateBlocOrderCard>(
//             builder: (context, state) {
//               if (state is StateLoadDataOrderCard) {
//                 return Padding(
//                   padding: const EdgeInsets.only(
//                     left: 10,
//                     right: 10,
//                     // bottom: 20,
//                   ),
//                   child: ConstrainedBox(
//                     constraints: const BoxConstraints(
//                       maxHeight: 60,
//                     ),
//                     child: isScan &&
//                             // point!.products!.isNotEmpty && // TODO
//                             (state.order.status == "accepted" ||
//                                 state.order.status == "in_process")
//                         ? GestureDetector(
//                             onTap: () {
//                               AppRouter.push(
//                                 context,
//                                 BlocProvider<BlocOrderFinish>(
//                                   create: (context) => BlocOrderFinish(
//                                     repository:
//                                         context.read<GlobalRepository>(),
//                                   )..add(
//                                       EventOrderFinishInitial(
//                                         pointId: point!.id!,
//                                       ),
//                                     ),
//                                   child: OrderFinish(
//                                     orderData: state.order,
//                                     isScan: widget.order.points!.first.id ==
//                                         point!.id,
//                                     // isScan: ,
//                                   ),
//                                 ),
//                               ).then((value) {
//                                 context.read<BlocOrderCard>().add(
//                                       EventInitialOrderCard(state.order.id!),
//                                     );
//                               });
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(vertical: 16),
//                               decoration: BoxDecoration(
//                                 color: ColorPalette.main,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Center(
//                                     child: Text(
//                                       "Приехал",
//                                       style: ProjectTextStyles.ui_16Medium
//                                           .copyWith(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 3,
//                                     right: 15,
//                                     child: SvgPicture.asset(
//                                       "assets/images/svg/arrow_right.svg",
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         : state.order.status == "accepted" ||
//                                 state.order.status == "in_process"
//                             ? GestureDetector(
//                                 onTap: () {
//                                   showModalBottomSheet(
//                                     context: context,
//                                     isScrollControlled: true,
//                                     isDismissible: true,
//                                     backgroundColor: const Color(0xFFFFFFFF),
//                                     shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.vertical(
//                                         top: Radius.circular(16),
//                                       ),
//                                     ),
//                                     builder: (context) {
//                                       return const TransferOrderBottomSheet();
//                                     },
//                                   );
//                                   return;
//                                   showAppBottomSheet(
//                                     context,
//                                     initialChildSize: 0.45,
//                                     useRootNavigator: true,
//                                     child: const BuildCauses(),
//                                   ).then(
//                                     (value) {
//                                       if (value != null) {
//                                         if (value == items[0] ||
//                                             value == items[1] ||
//                                             value == items[2]) {
//                                           context.read<BlocOrderCard>().add(
//                                                 EventStopOrder(
//                                                   cause: value == items[0]
//                                                       ? "snack"
//                                                       : value == items[1]
//                                                           ? "sleep"
//                                                           : "relax",
//                                                 ),
//                                               );
//                                         }
//                                         if (value == items[4]) {
//                                           /// FIXME
//                                           // context.read<BlocOrderCard>().add(
//                                           //       EventStopOrder(
//                                           //         cause: "change_driver",
//                                           //       ),
//                                           //     );
//                                           showModalBottomSheet(
//                                             context: context,
//                                             isScrollControlled: true,
//                                             isDismissible: true,
//                                             backgroundColor:
//                                                 const Color(0xFFFFFFFF),
//                                             shape: const RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.vertical(
//                                                 top: Radius.circular(16),
//                                               ),
//                                             ),
//                                             builder: (context) {
//                                               return const TransferOrderBottomSheet();
//                                             },
//                                           );
//                                           // showAppBottomSheet(
//                                           //   context,
//                                           //   // initialChildSize: 0.5,
//                                           //   useRootNavigator: true,
//                                           //   child:
//                                           //       const TransferOrderBottomSheet(),
//                                           // );
//                                         }
//                                       }
//                                     },
//                                   );
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     vertical: 16,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: ColorPalette.white,
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                       color: ColorPalette.main,
//                                     ),
//                                   ),
//                                   child: Stack(
//                                     children: [
//                                       Center(
//                                         child: Text(
//                                           "Стоп",
//                                           style: ProjectTextStyles.ui_16Medium
//                                               .copyWith(
//                                             color: ColorPalette.main,
//                                           ),
//                                         ),
//                                       ),
//                                       Positioned(
//                                         top: 3,
//                                         right: 15,
//                                         child: SvgPicture.asset(
//                                           "assets/images/svg/chevrone_down.svg",
//                                           width: 24,
//                                           height: 24,
//                                           color: ColorPalette.main,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             : state.order.status == "stopped"
//                                 ? GestureDetector(
//                                     onTap: () {
//                                       context
//                                           .read<BlocOrderCard>()
//                                           .add(EventResumeOrder());
//                                     },
//                                     child: Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         vertical: 16,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: ColorPalette.main,
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: Stack(
//                                         children: [
//                                           Center(
//                                             child: Text(
//                                               "Выйти на линию",
//                                               style: ProjectTextStyles
//                                                   .ui_16Medium
//                                                   .copyWith(
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                           Positioned(
//                                             top: 3,
//                                             right: 15,
//                                             child: SvgPicture.asset(
//                                               "assets/images/svg/arrow_right.svg",
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 : GestureDetector(
//                                     onTap: () {
//                                       context
//                                           .read<BlocOrderCard>()
//                                           .add(EventStartOrder());
//                                     },
//                                     child: Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         vertical: 16,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: ColorPalette.main,
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: Stack(
//                                         children: [
//                                           Center(
//                                             child: Text(
//                                               "Поехали",
//                                               style: ProjectTextStyles
//                                                   .ui_16Medium
//                                                   .copyWith(
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                           Positioned(
//                                             top: 3,
//                                             right: 15,
//                                             child: SvgPicture.asset(
//                                               "assets/images/svg/arrow_right.svg",
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                   ),
//                 );
//               } else {
//                 return const SizedBox();
//               }
//             },
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,
//           body: BlocConsumer<BlocOrderCard, StateBlocOrderCard>(
//             listener: (context, state) {
//               if (state is StateLoadingOrderCard) {
//                 context.loaderOverlay.show();
//               } else {
//                 context.loaderOverlay.hide();
//               }
//               if (state is StateOrderCardError) {
//                 showAppDialog(context, body: state.error.message);
//               }
//               if (state is StateStartSuccess) {
//                 showAppDialog(context, body: "заказ успешно принят");
//                 Navigator.of(context).pop();
//                 setState(() {
//                   widget.order.status = "accepted";
//                   widget.order.isCurrent = true;
//                 });
//               }
//               if (state is StateResumeSuccess) {
//                 showAppDialog(context, body: "заказ успешно запущен");
//                 Navigator.of(context).pop();
//                 setState(() {
//                   widget.order.status = "accepted";
//                 });
//               }
//               if (state is StateShowTimerInitial) {
//                 final time = state.startTimer.isBefore(DateTime.now())
//                     ? Duration.zero
//                     : state.startTimer.difference(DateTime.now());
//                 showAppBottomSheet(
//                   context,
//                   useRootNavigator: true,
//                   isDismissible: false,
//                   enableDrag: false,
//                   child: Column(
//                     children: [
//                       const Text("Перерыв"),
//                       SizedBox(
//                         height: 100,
//                         child: TimerPage(
//                           duration: time,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 18.0,
//                           horizontal: 10,
//                         ),
//                         child: Row(
//                           children: [
//                             MainButton(
//                               width: 80,
//                               icon: "assets/images/svg/arrow_left.svg",
//                               iconColor: ColorPalette.white,
//                               onTap: () {
//                                 Navigator.popUntil(
//                                   context,
//                                   (route) => route.isFirst,
//                                 );
//                               },
//                             ),
//                             const SizedBox(
//                               width: 8,
//                             ),
//                             MainButton(
//                               width:
//                                   MediaQuery.of(context).size.width - 90 - 20,
//                               onTap: () {
//                                 context
//                                     .read<BlocOrderCard>()
//                                     .add(EventResumeOrder());
//                                 Navigator.pop(context);
//                               },
//                               title: "Выйти на линию",
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }
//               if (state is StateStopSuccess) {
//                 showAppDialog(context, body: "заказ успешно остановлен");
//                 Navigator.of(context).pop();
//                 setState(() {
//                   widget.order.status = "stopped";
//                 });
//               }
//             },
//             buildWhen: (p, c) => c is StateLoadDataOrderCard,
//             builder: (context, state) {
//               if (state is StateLoadDataOrderCard) {
//                 return Column(
//                   children: [
//                     Expanded(
//                       flex: 8,
//                       child: Column(
//                         children: [
//                           Visibility(
//                             visible: state.order.isCurrent,
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                     vertical: 0,
//                                     horizontal: 10,
//                                   ),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(12),
//                                     child: Container(
//                                       width: double.infinity,
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.3,
//                                       //height: 300,
//                                       decoration: BoxDecoration(
//                                         color: ColorPalette.white,
//                                         borderRadius: BorderRadius.circular(16),
//                                       ),
//                                       child: BlocProvider(
//                                         create: (_) => MapCubit(
//                                           mapRepository: MapRepository(),
//                                           repository:
//                                               context.read<GlobalRepository>(),
//                                         ),
//                                         child: SessionPage(
//                                           orderId: state.order.id!,
//                                           orderData: state.order,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: <Widget>[
//                                     Text(
//                                       DateFormat("dd MMMM, hh:mm")
//                                           .format(state.order.startDate!),
//                                       style: ProjectTextStyles.ui_12Medium
//                                           .copyWith(
//                                         color: ColorPalette.commonGrey,
//                                       ),
//                                     ),
//                                     Text(state.order.from!),
//                                   ],
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: <Widget>[
//                                     Text(
//                                       DateFormat("dd MMMM, hh:mm")
//                                           .format(state.order.endDate!),
//                                       style: ProjectTextStyles.ui_12Medium
//                                           .copyWith(
//                                         color: ColorPalette.commonGrey,
//                                       ),
//                                     ),
//                                     Text(state.order.to!),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),

//                           ///
//                           ///
//                           ///  Али алып таста деп айтты
//                           ///
//                           ///
//                           // Padding(
//                           //   padding: const EdgeInsets.symmetric(horizontal: 10),
//                           //   child: Row(
//                           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //     children: [
//                           //       Text(
//                           //         state.order.from!
//                           //             .replaceRange(
//                           //                 3, state.order.from!.length, "")
//                           //             .toUpperCase(),
//                           //         style: ProjectTextStyles.ui_12Medium
//                           //             .copyWith(color: ColorPalette.main),
//                           //       ),
//                           //       Row(
//                           //         children: [
//                           //           SizedBox(
//                           //             width: MediaQuery.of(context).size.width -
//                           //                 90,
//                           //             child: Container(
//                           //               height: 80,
//                           //               padding: const EdgeInsets.symmetric(
//                           //                   horizontal: 10),
//                           //               child: FlutterSlider(
//                           //                 jump: false,
//                           //                 disabled: true,
//                           //                 selectByTap: true,
//                           //                 max: 100,
//                           //                 min: 0,
//                           //                 values: [_lowerValue],
//                           //                 trackBar: const FlutterSliderTrackBar(
//                           //                     activeDisabledTrackBarColor:
//                           //                         ColorPalette.main,
//                           //                     inactiveDisabledTrackBarColor:
//                           //                         ColorPalette.commonBlue,
//                           //                     activeTrackBarHeight: 1,
//                           //                     inactiveTrackBarHeight: 1),
//                           //                 handler: FlutterSliderHandler(
//                           //                   // rightHandler: customHandler(Icons.chevron_left),
//                           //                   decoration: const BoxDecoration(
//                           //                       shape: BoxShape.circle),
//                           //                   child: Material(
//                           //                     // type: MaterialType.canvas,
//                           //                     color: ColorPalette.main,
//                           //                     elevation: 3,
//                           //                     borderRadius:
//                           //                         BorderRadius.circular(50),
//                           //                     child: Container(
//                           //                         width: 18,
//                           //                         height: 18,
//                           //                         padding:
//                           //                             const EdgeInsets.all(7),
//                           //                         child: const Icon(
//                           //                           Icons.circle,
//                           //                           size: 4,
//                           //                           color: Colors.white,
//                           //                         )),
//                           //                   ),
//                           //                 ),
//                           //               ),
//                           //             ),
//                           //           ),
//                           //         ],
//                           //       ),
//                           //       Text(
//                           //         state.order.to!
//                           //             .replaceRange(
//                           //                 3, state.order.to!.length, "")
//                           //             .toUpperCase(),
//                           //         overflow: TextOverflow.ellipsis,
//                           //         style: ProjectTextStyles.ui_12Medium
//                           //             .copyWith(color: ColorPalette.dark),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),

//                           Expanded(
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   const Divider(
//                                     color: ColorPalette.lightGrey,
//                                     thickness: 2,
//                                   ),

//                                   ///
//                                   /// /// Али машинаны алып таста деп айтты
//                                   ///
//                                   // Padding(
//                                   //   padding: const EdgeInsets.symmetric(
//                                   //       horizontal: 10.0),
//                                   //   child: Column(
//                                   //     children: const [
//                                   //       Divider(
//                                   //         color: ColorPalette.lightGrey,
//                                   //         thickness: 2,
//                                   //       ),

//                                   //       /// Али машинаны алып таста деп айтты
//                                   //       // Container(
//                                   //       //   padding: const EdgeInsets.symmetric(
//                                   //       //       vertical: 10),
//                                   //       //   child: Row(
//                                   //       //     children: <Widget>[
//                                   //       //       Image.asset(
//                                   //       //           'assets/images/png/orders_truck.png'),
//                                   //       //       Column(
//                                   //       //         crossAxisAlignment:
//                                   //       //             CrossAxisAlignment.start,
//                                   //       //         children: <Widget>[
//                                   //       //           const Text(
//                                   //       //             "Mercedes-Benz Sprinter",
//                                   //       //             style: ProjectTextStyles
//                                   //       //                 .ui_16Medium,
//                                   //       //           ),
//                                   //       //           Text(
//                                   //       //             "A 986 DBN",
//                                   //       //             style: ProjectTextStyles
//                                   //       //                 .ui_12Medium
//                                   //       //                 .copyWith(
//                                   //       //                     color: ColorPalette
//                                   //       //                         .darkGrey),
//                                   //       //           ),
//                                   //       //         ],
//                                   //       //       ),
//                                   //       //     ],
//                                   //       //   ),
//                                   //       // ),
//                                   //       // const Divider(
//                                   //       //   color: ColorPalette.lightGrey,
//                                   //       //   thickness: 2,
//                                   //       // ),
//                                   //     ],
//                                   //   ),
//                                   // ),

//                                   _BuildOrderItem(
//                                     order: state.order,
//                                     callback: ({
//                                       required bool isOpened,
//                                       required OrderPoint orderPoint,
//                                     }) {
//                                       log('isOpened in _BuildOrderItem : $isOpened');
//                                       setState(() {
//                                         isScan = isOpened;
//                                         point = orderPoint;
//                                       });
//                                     },
//                                   )
//                                   // BlocBuilder<BlocOrderCard, StateBlocOrderCard>(
//                                   //   builder: (context, state) {
//                                   //     if (state is StateLoadDataOrderCard) {
//                                   //       return _BuildOrderItem(
//                                   //         order: widget.order,
//                                   //         callback: (isOpened, orderPoint) {
//                                   //           setState(() {
//                                   //             isScan = isOpened;
//                                   //             point = orderPoint;
//                                   //           });
//                                   //         },
//                                   //       );
//                                   //     }
//                                   //     return const Center(
//                                   //       child: CircularProgressIndicator(),
//                                   //     );
//                                   //   },
//                                   // ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     ///
//                     ///
//                     ///
//                     ///
//                     ///

//                     // Flexible(
//                     //   child: Padding(
//                     //     padding: const EdgeInsets.only(
//                     //       left: 10,
//                     //       right: 10,
//                     //       bottom: 30,
//                     //     ),
//                     //     child: isScan &&
//                     //             // point!.products!.isNotEmpty && // TODO
//                     //             (state.order.status == "accepted" ||
//                     //                 state.order.status == "in_process")
//                     //         ? GestureDetector(
//                     //             onTap: () {
//                     //               AppRouter.push(
//                     //                 context,
//                     //                 BlocProvider<BlocOrderFinish>(
//                     //                   create: (context) => BlocOrderFinish(
//                     //                     repository:
//                     //                         context.read<GlobalRepository>(),
//                     //                   )..add(
//                     //                       EventOrderFinishInitial(
//                     //                         pointId: point!.id!,
//                     //                       ),
//                     //                     ),
//                     //                   child: OrderFinish(
//                     //                     orderData: state.order,
//                     //                     isScan: widget.order.points!.first.id ==
//                     //                         point!.id,
//                     //                     // isScan: ,
//                     //                   ),
//                     //                 ),
//                     //               ).then((value) {
//                     //                 context.read<BlocOrderCard>().add(
//                     //                       EventInitialOrderCard(
//                     //                           state.order.id!),
//                     //                     );
//                     //               });
//                     //             },
//                     //             child: Container(
//                     //               padding:
//                     //                   const EdgeInsets.symmetric(vertical: 16),
//                     //               decoration: BoxDecoration(
//                     //                 color: ColorPalette.main,
//                     //                 borderRadius: BorderRadius.circular(10),
//                     //               ),
//                     //               child: Stack(
//                     //                 children: [
//                     //                   Center(
//                     //                     child: Text(
//                     //                       "Приехал",
//                     //                       style: ProjectTextStyles.ui_16Medium
//                     //                           .copyWith(
//                     //                         color: Colors.white,
//                     //                       ),
//                     //                     ),
//                     //                   ),
//                     //                   Positioned(
//                     //                     top: 3,
//                     //                     right: 15,
//                     //                     child: SvgPicture.asset(
//                     //                       "assets/images/svg/arrow_right.svg",
//                     //                     ),
//                     //                   )
//                     //                 ],
//                     //               ),
//                     //             ),
//                     //           )
//                     //         : state.order.status == "accepted" ||
//                     //                 state.order.status == "in_process"
//                     //             ? GestureDetector(
//                     //                 onTap: () {
//                     //                   showModalBottomSheet(
//                     //                     context: context,
//                     //                     isScrollControlled: true,
//                     //                     isDismissible: true,
//                     //                     backgroundColor:
//                     //                         const Color(0xFFFFFFFF),
//                     //                     shape: const RoundedRectangleBorder(
//                     //                       borderRadius: BorderRadius.vertical(
//                     //                         top: Radius.circular(16),
//                     //                       ),
//                     //                     ),
//                     //                     builder: (context) {
//                     //                       return const TransferOrderBottomSheet();
//                     //                     },
//                     //                   );
//                     //                   return;
//                     //                   showAppBottomSheet(
//                     //                     context,
//                     //                     initialChildSize: 0.45,
//                     //                     useRootNavigator: true,
//                     //                     child: const BuildCauses(),
//                     //                   ).then(
//                     //                     (value) {
//                     //                       if (value != null) {
//                     //                         if (value == items[0] ||
//                     //                             value == items[1] ||
//                     //                             value == items[2]) {
//                     //                           context.read<BlocOrderCard>().add(
//                     //                                 EventStopOrder(
//                     //                                   cause: value == items[0]
//                     //                                       ? "snack"
//                     //                                       : value == items[1]
//                     //                                           ? "sleep"
//                     //                                           : "relax",
//                     //                                 ),
//                     //                               );
//                     //                         }
//                     //                         if (value == items[4]) {
//                     //                           /// FIXME
//                     //                           // context.read<BlocOrderCard>().add(
//                     //                           //       EventStopOrder(
//                     //                           //         cause: "change_driver",
//                     //                           //       ),
//                     //                           //     );
//                     //                           showModalBottomSheet(
//                     //                             context: context,
//                     //                             isScrollControlled: true,
//                     //                             isDismissible: true,
//                     //                             backgroundColor:
//                     //                                 const Color(0xFFFFFFFF),
//                     //                             shape:
//                     //                                 const RoundedRectangleBorder(
//                     //                               borderRadius:
//                     //                                   BorderRadius.vertical(
//                     //                                 top: Radius.circular(16),
//                     //                               ),
//                     //                             ),
//                     //                             builder: (context) {
//                     //                               return const TransferOrderBottomSheet();
//                     //                             },
//                     //                           );
//                     //                           // showAppBottomSheet(
//                     //                           //   context,
//                     //                           //   // initialChildSize: 0.5,
//                     //                           //   useRootNavigator: true,
//                     //                           //   child:
//                     //                           //       const TransferOrderBottomSheet(),
//                     //                           // );
//                     //                         }
//                     //                       }
//                     //                     },
//                     //                   );
//                     //                 },
//                     //                 child: Container(
//                     //                   padding: const EdgeInsets.symmetric(
//                     //                     vertical: 16,
//                     //                   ),
//                     //                   decoration: BoxDecoration(
//                     //                     color: ColorPalette.white,
//                     //                     borderRadius: BorderRadius.circular(10),
//                     //                     border: Border.all(
//                     //                       color: ColorPalette.main,
//                     //                     ),
//                     //                   ),
//                     //                   child: Stack(
//                     //                     children: [
//                     //                       Center(
//                     //                         child: Text(
//                     //                           "Стоп",
//                     //                           style: ProjectTextStyles
//                     //                               .ui_16Medium
//                     //                               .copyWith(
//                     //                             color: ColorPalette.main,
//                     //                           ),
//                     //                         ),
//                     //                       ),
//                     //                       Positioned(
//                     //                         top: 3,
//                     //                         right: 15,
//                     //                         child: SvgPicture.asset(
//                     //                           "assets/images/svg/chevrone_down.svg",
//                     //                           width: 24,
//                     //                           height: 24,
//                     //                           color: ColorPalette.main,
//                     //                         ),
//                     //                       )
//                     //                     ],
//                     //                   ),
//                     //                 ),
//                     //               )
//                     //             : state.order.status == "stopped"
//                     //                 ? GestureDetector(
//                     //                     onTap: () {
//                     //                       context
//                     //                           .read<BlocOrderCard>()
//                     //                           .add(EventResumeOrder());
//                     //                     },
//                     //                     child: Container(
//                     //                       padding: const EdgeInsets.symmetric(
//                     //                         vertical: 16,
//                     //                       ),
//                     //                       decoration: BoxDecoration(
//                     //                         color: ColorPalette.main,
//                     //                         borderRadius:
//                     //                             BorderRadius.circular(10),
//                     //                       ),
//                     //                       child: Stack(
//                     //                         children: [
//                     //                           Center(
//                     //                             child: Text(
//                     //                               "Выйти на линию",
//                     //                               style: ProjectTextStyles
//                     //                                   .ui_16Medium
//                     //                                   .copyWith(
//                     //                                 color: Colors.white,
//                     //                               ),
//                     //                             ),
//                     //                           ),
//                     //                           Positioned(
//                     //                             top: 3,
//                     //                             right: 15,
//                     //                             child: SvgPicture.asset(
//                     //                               "assets/images/svg/arrow_right.svg",
//                     //                             ),
//                     //                           )
//                     //                         ],
//                     //                       ),
//                     //                     ),
//                     //                   )
//                     //                 : GestureDetector(
//                     //                     onTap: () {
//                     //                       context
//                     //                           .read<BlocOrderCard>()
//                     //                           .add(EventStartOrder());
//                     //                     },
//                     //                     child: Container(
//                     //                       padding: const EdgeInsets.symmetric(
//                     //                         vertical: 16,
//                     //                       ),
//                     //                       decoration: BoxDecoration(
//                     //                         color: ColorPalette.main,
//                     //                         borderRadius:
//                     //                             BorderRadius.circular(10),
//                     //                       ),
//                     //                       child: Stack(
//                     //                         children: [
//                     //                           Center(
//                     //                             child: Text(
//                     //                               "Поехали",
//                     //                               style: ProjectTextStyles
//                     //                                   .ui_16Medium
//                     //                                   .copyWith(
//                     //                                 color: Colors.white,
//                     //                               ),
//                     //                             ),
//                     //                           ),
//                     //                           Positioned(
//                     //                             top: 3,
//                     //                             right: 15,
//                     //                             child: SvgPicture.asset(
//                     //                               "assets/images/svg/arrow_right.svg",
//                     //                             ),
//                     //                           )
//                     //                         ],
//                     //                       ),
//                     //                     ),
//                     //                   ),
//                     //   ),
//                     // ),

//                     ///
//                     ///
//                     ///
//                     ///
//                     ///

//                     // ///Button
//                     // BlocBuilder<BlocOrderCard, StateBlocOrderCard>(
//                     //   builder: (context, state) {
//                     //     return Padding(
//                     //       padding: const EdgeInsets.only(
//                     //           left: 10, right: 10, bottom: 30),
//                     //       child: isScan &&
//                     //               point!.products!.isNotEmpty &&
//                     //               (state.order.status == "accepted" ||
//                     //                   state.order.status == "in_process")
//                     //           ? GestureDetector(
//                     //               onTap: () {
//                     //                 AppRouter.push(
//                     //                     context,
//                     //                     BlocProvider<BlocOrderFinish>(
//                     //                       create: (context) => BlocOrderFinish(
//                     //                         repository:
//                     //                             context.read<GlobalRepository>(),
//                     //                       )..add(EventOrderFinishInitial(
//                     //                           pointId: point!.id!)),
//                     //                       child: OrderFinish(
//                     //                         orderData: state.order,
//                     //                       ),
//                     //                     )).then((value) {
//                     //                   context.read<BlocOrderCard>().add(
//                     //                       EventInitialOrderCard(
//                     //                           state.order.id!));
//                     //                 });
//                     //               },
//                     //               child: Container(
//                     //                 padding:
//                     //                     const EdgeInsets.symmetric(vertical: 16),
//                     //                 decoration: BoxDecoration(
//                     //                     color: ColorPalette.main,
//                     //                     borderRadius: BorderRadius.circular(10)),
//                     //                 child: Stack(
//                     //                   children: [
//                     //                     Center(
//                     //                       child: Text(
//                     //                         "Приехал",
//                     //                         style: ProjectTextStyles.ui_16Medium
//                     //                             .copyWith(
//                     //                           color: Colors.white,
//                     //                         ),
//                     //                       ),
//                     //                     ),
//                     //                     Positioned(
//                     //                         top: 3,
//                     //                         right: 15,
//                     //                         child: SvgPicture.asset(
//                     //                             "assets/images/svg/arrow_right.svg"))
//                     //                   ],
//                     //                 ),
//                     //               ),
//                     //             )
//                     //           : state.order.status == "accepted" ||
//                     //                   state.order.status == "in_process"
//                     //               ? GestureDetector(
//                     //                   onTap: () {
//                     //                     showAppBottomSheet(context,
//                     //                             initialChildSize: 0.45,
//                     //                             useRootNavigator: true,
//                     //                             child: const BuildCauses())
//                     //                         .then((value) {
//                     //                       if (value != null) {
//                     //                         if (value == items[0] ||
//                     //                             value == items[1] ||
//                     //                             value == items[2]) {
//                     //                           context
//                     //                               .read<BlocOrderCard>()
//                     //                               .add(EventStopOrder(
//                     //                                   cause: value == items[0]
//                     //                                       ? "snack"
//                     //                                       : value == items[1]
//                     //                                           ? "sleep"
//                     //                                           : "relax"));
//                     //                         }
//                     //                         if (value == items[4]) {
//                     //                           context.read<BlocOrderCard>().add(
//                     //                               EventStopOrder(
//                     //                                   cause: "change_driver"));
//                     //                           showAppBottomSheet(context,
//                     //                               // initialChildSize: 0.5,
//                     //                               useRootNavigator: true,
//                     //                               child: Column(
//                     //                                 children: [
//                     //                                   const Text(
//                     //                                       "Передать заказ другому водителю"),
//                     //                                   Padding(
//                     //                                     padding:
//                     //                                         const EdgeInsets.all(
//                     //                                             8.0),
//                     //                                     child: AppTextField(
//                     //                                       prefixIcon: const Icon(
//                     //                                           Icons.search),
//                     //                                       hintText: "Поиск",
//                     //                                     ),
//                     //                                   ),
//                     //                                   const Padding(
//                     //                                     padding:
//                     //                                         EdgeInsets.symmetric(
//                     //                                             vertical: 8.0),
//                     //                                     child: EmployerCard(),
//                     //                                   ),
//                     //                                   Padding(
//                     //                                     padding: const EdgeInsets
//                     //                                             .symmetric(
//                     //                                         vertical: 18.0,
//                     //                                         horizontal: 10),
//                     //                                     child: MainButton(
//                     //                                       onTap: () {},
//                     //                                       title: "Готово",
//                     //                                     ),
//                     //                                   )
//                     //                                 ],
//                     //                               ));
//                     //                         }
//                     //                       }
//                     //                     });
//                     //                   },
//                     //                   child: Container(
//                     //                     padding: const EdgeInsets.symmetric(
//                     //                         vertical: 16),
//                     //                     decoration: BoxDecoration(
//                     //                         color: ColorPalette.white,
//                     //                         borderRadius:
//                     //                             BorderRadius.circular(10),
//                     //                         border: Border.all(
//                     //                             color: ColorPalette.main)),
//                     //                     child: Stack(
//                     //                       children: [
//                     //                         Center(
//                     //                           child: Text(
//                     //                             "Стоп",
//                     //                             style: ProjectTextStyles
//                     //                                 .ui_16Medium
//                     //                                 .copyWith(
//                     //                               color: ColorPalette.main,
//                     //                             ),
//                     //                           ),
//                     //                         ),
//                     //                         Positioned(
//                     //                             top: 3,
//                     //                             right: 15,
//                     //                             child: SvgPicture.asset(
//                     //                               "assets/images/svg/chevrone_down.svg",
//                     //                               width: 24,
//                     //                               height: 24,
//                     //                               color: ColorPalette.main,
//                     //                             ))
//                     //                       ],
//                     //                     ),
//                     //                   ),
//                     //                 )
//                     //               : state.order.status == "stopped"
//                     //                   ? GestureDetector(
//                     //                       onTap: () {
//                     //                         context
//                     //                             .read<BlocOrderCard>()
//                     //                             .add(EventResumeOrder());
//                     //                       },
//                     //                       child: Container(
//                     //                         padding: const EdgeInsets.symmetric(
//                     //                             vertical: 16),
//                     //                         decoration: BoxDecoration(
//                     //                             color: ColorPalette.main,
//                     //                             borderRadius:
//                     //                                 BorderRadius.circular(10)),
//                     //                         child: Stack(
//                     //                           children: [
//                     //                             Center(
//                     //                               child: Text(
//                     //                                 "Выйти на линию",
//                     //                                 style: ProjectTextStyles
//                     //                                     .ui_16Medium
//                     //                                     .copyWith(
//                     //                                   color: Colors.white,
//                     //                                 ),
//                     //                               ),
//                     //                             ),
//                     //                             Positioned(
//                     //                                 top: 3,
//                     //                                 right: 15,
//                     //                                 child: SvgPicture.asset(
//                     //                                     "assets/images/svg/arrow_right.svg"))
//                     //                           ],
//                     //                         ),
//                     //                       ),
//                     //                     )
//                     //                   : GestureDetector(
//                     //                       onTap: () {
//                     //                         context
//                     //                             .read<BlocOrderCard>()
//                     //                             .add(EventStartOrder());
//                     //                       },
//                     //                       child: Container(
//                     //                         padding: const EdgeInsets.symmetric(
//                     //                             vertical: 16),
//                     //                         decoration: BoxDecoration(
//                     //                             color: ColorPalette.main,
//                     //                             borderRadius:
//                     //                                 BorderRadius.circular(10)),
//                     //                         child: Stack(
//                     //                           children: [
//                     //                             Center(
//                     //                               child: Text(
//                     //                                 "Поехали",
//                     //                                 style: ProjectTextStyles
//                     //                                     .ui_16Medium
//                     //                                     .copyWith(
//                     //                                   color: Colors.white,
//                     //                                 ),
//                     //                               ),
//                     //                             ),
//                     //                             Positioned(
//                     //                                 top: 3,
//                     //                                 right: 15,
//                     //                                 child: SvgPicture.asset(
//                     //                                     "assets/images/svg/arrow_right.svg"))
//                     //                           ],
//                     //                         ),
//                     //                       ),
//                     //                     ),
//                     //     );
//                     //   },
//                     // ),
//                   ],
//                 );
//               }
//               return const SizedBox(); // const Center(child: CircularProgressIndicator());
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   FlutterSliderHandler customHandler(IconData icon) {
//     return FlutterSliderHandler(
//       decoration: const BoxDecoration(),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.circle,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.blue.withOpacity(0.3),
//               spreadRadius: 0.05,
//               blurRadius: 5,
//               offset: const Offset(0, 1),
//             )
//           ],
//         ),
//         child: Container(
//           margin: const EdgeInsets.all(5),
//           decoration: BoxDecoration(
//             color: Colors.blue.withOpacity(0.3),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             icon,
//             color: Colors.white,
//             size: 23,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _BuildOrderItem extends StatefulWidget {
//   final OrderData order;
//   final Function({
//     required bool isOpened,
//     required OrderPoint orderPoint,
//   }) callback;

//   const _BuildOrderItem({
//     Key? key,
//     required this.order,
//     required this.callback,
//   }) : super(key: key);

//   @override
//   State<_BuildOrderItem> createState() => _BuildOrderItemState();
// }

// class _BuildOrderItemState extends State<_BuildOrderItem> {
//   int selected = -1;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       key: GlobalKey(),
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 12,
//           ),
//           Stack(
//             children: [
//               // Padding(
//               //   padding: const EdgeInsets.only(left: 16.0, top: 40),
//               //   child: DottedLine(
//               //     direction: Axis.vertical,
//               //     dashColor: ColorPalette.commonGrey,
//               //     lineLength: MediaQuery.of(context).size.height * 0.75,
//               //   ),
//               // ),
//               Column(
//                 children: [
//                   _BuildPointItem(
//                     icon: "orders_geo",
//                     city: widget.order.from,
//                     date: widget.order.startDate,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   for (int i = 0; i < widget.order.points!.length; i++)
//                     _BuildExpandablePointItem(
//                       point: widget.order.points![i],
//                       isExpanded: i == selected,
//                       onExpansionChanged: (bool isOpened) {
//                         setState(() {
//                           if (isOpened) {
//                             selected = i;
//                           } else {
//                             selected = -1;
//                           }
//                           // if (widget.order.points![i].status == "finished") {
//                           widget.callback.call(
//                             isOpened:
//                                 widget.order.points![i].status == "finished" ||
//                                         (i != 0 &&
//                                             widget.order.points![0].status !=
//                                                 "finished")
//                                     ? false
//                                     : isOpened,
//                             orderPoint: widget.order.points![i],
//                           );
//                           // }
//                         });
//                       },
//                     ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   _BuildPointItem(
//                     icon: "orders_geo_done",
//                     city: widget.order.to,
//                     date: widget.order.endDate,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _BuildPointItem extends StatelessWidget {
//   final String icon;
//   final String? city;
//   final DateTime? date;

//   const _BuildPointItem({
//     Key? key,
//     required this.icon,
//     required this.city,
//     required this.date,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 33,
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: ColorPalette.main,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: SvgPicture.asset(
//             "assets/images/svg/$icon.svg",
//             color: ColorPalette.white,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 9),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 DateFormat("dd MMMM yyyy, в hh:mm")
//                     .format(date ?? DateTime.now()),
//                 style: ProjectTextStyles.ui_12Medium
//                     .copyWith(color: ColorPalette.commonGrey),
//               ),
//               Text(
//                 city ?? S.of(context).no_data,
//                 style: ProjectTextStyles.ui_16Medium,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _BuildExpandablePointItem extends StatelessWidget {
//   final OrderPoint point;
//   final bool isExpanded;
//   final Function(bool) onExpansionChanged;

//   const _BuildExpandablePointItem({
//     Key? key,
//     required this.point,
//     required this.isExpanded,
//     required this.onExpansionChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5.0),
//       child: ExpansionTile(
//         onExpansionChanged: onExpansionChanged,
//         initiallyExpanded: isExpanded,
//         tilePadding: EdgeInsets.zero,
//         expandedAlignment: Alignment.topLeft,
//         childrenPadding: const EdgeInsets.only(left: 40),
//         title: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(7),
//               decoration: BoxDecoration(
//                 color: point.status == "finished"
//                     ? ColorPalette.main
//                     : ColorPalette.lightGrey,
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: SvgPicture.asset(
//                 "assets/images/svg/order_item.svg",
//                 color: point.status == "finished" ? ColorPalette.white : null,
//                 width: 12,
//                 height: 12,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 9),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Divider(
//                     thickness: 1,
//                     height: 2,
//                     color: ColorPalette.lightGrey,
//                   ),
//                   Text(
//                     DateFormat("dd MMMM yyyy, в hh:mm")
//                         .format(point.date ?? DateTime.now()),
//                     style: ProjectTextStyles.ui_12Medium
//                         .copyWith(color: ColorPalette.commonGrey),
//                   ),
//                   Text(
//                     point.name ?? S.of(context).no_data,
//                     style: ProjectTextStyles.ui_16Medium,
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       if (!isExpanded)
//                         SvgPicture.asset(
//                           "assets/images/svg/pin-location.svg",
//                           color: point.status == "finished"
//                               ? ColorPalette.main
//                               : null,
//                         ),
//                       if (!isExpanded)
//                         const SizedBox(
//                           width: 4,
//                         ),
//                       if (!isExpanded)
//                         Text(
//                           point.address == null
//                               ? S.of(context).no_data
//                               : point.address!.length > 40
//                                   ? '${point.address!.substring(0, 37)}...'
//                                   : point.address!,
//                           style: ProjectTextStyles.ui_12Medium.copyWith(
//                             color: ColorPalette.commonGrey,
//                           ),
//                         ),
//                     ],
//                   ),
//                   const Divider(
//                     thickness: 1,
//                     height: 2,
//                     color: ColorPalette.lightGrey,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 point.address == null ? S.of(context).no_data : point.address!,
//                 style: ProjectTextStyles.ui_12Medium.copyWith(
//                   color: ColorPalette.commonGrey,
//                 ),
//               ),
//               const SizedBox(width: 4),
//               Text(
//                 "Количество контейнеров - ${point.countProducts.toString()} ",
//                 textAlign: TextAlign.left,
//                 style: ProjectTextStyles.ui_12Medium
//                     .copyWith(color: ColorPalette.black),
//               ),
//               if (point.products != null)
//                 for (int k = 0; k < point.products!.length; k++)
//                   Text(
//                     point.products?[k].name ?? S.of(context).no_data,
//                     style: ProjectTextStyles.ui_12Medium
//                         .copyWith(color: ColorPalette.commonGrey),
//                   ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
