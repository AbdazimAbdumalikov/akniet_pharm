import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/network/models/order_dto.dart';
import 'package:europharm_flutter/screens/notifications_screen/ui/notifications_page.dart';
import 'package:europharm_flutter/screens/order_card/ui/order_detail_page.dart';
import 'package:europharm_flutter/screens/orders_screen/bloc/orders_bloc.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/utils/app_router.dart';
import 'package:europharm_flutter/widgets/app_bottom_sheets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:loader_overlay/loader_overlay.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorPalette.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: BlocConsumer<OrdersBloc, OrdersState>(
              buildWhen: (p, c) => c is StateLoadDataOrdersScreen,
              listener: (context, state) {
                if (state is OrdersStateLoading) {
                  context.loaderOverlay.show();
                } else {
                  context.loaderOverlay.hide();
                }
                if (state is StateOrdersScreenError) {
                  showAppDialog(
                    context,
                    body: state.error.message,
                  );
                }
              },
              builder: (context, state) {
                if (state is StateLoadDataOrdersScreen) {
                  return Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      /// Выберите город. Али алып тастау керек деп айтты
                      // Row(
                      //   children: [
                      //     SvgPicture.asset(
                      //       "assets/images/svg/location.svg",
                      //       color: ColorPalette.main,
                      //     ),
                      //     SizedBox(
                      //       width: 200,
                      //       child: DropdownButtonFormField(
                      //         iconSize: 0,
                      //         value:
                      //             selectedValue ?? state.cities.first.name,
                      //         decoration: InputDecoration(
                      //           suffixIcon: SvgPicture.asset(
                      //             "assets/images/svg/dropdown_arrow.svg",
                      //           ),
                      //           suffixIconConstraints: const BoxConstraints(
                      //             maxWidth: 24,
                      //             maxHeight: 24,
                      //           ),
                      //           isDense: false,
                      //           hintStyle: ProjectTextStyles.ui_16Medium,
                      //           enabledBorder: const OutlineInputBorder(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30)),
                      //             borderSide: BorderSide.none,
                      //           ),
                      //           filled: true,
                      //           contentPadding: const EdgeInsets.all(16),
                      //           fillColor: ColorPalette.background,
                      //         ),
                      //         items: state.cities.map((CityData city) {
                      //           return DropdownMenuItem<String>(
                      //             value: city.name,
                      //             child: Text(
                      //               city.name!,
                      //             ),
                      //           );
                      //         }).toList(),
                      //         validator: (value) {
                      //           if (value == null) {
                      //             return 'Выберите город';
                      //           }
                      //           return null;
                      //         },
                      //         onChanged: (e) {
                      //           setState(() {
                      //             cityId = state.cities
                      //                 .firstWhere(
                      //                   (element) => element.name == e,
                      //                 )
                      //                 .id!;
                      //           });
                      //           selectedValue = e.toString();
                      //           context.read<BlocOrdersScreen>().add(
                      //                 EventInitialOrdersScreen(
                      //                   cityId: state.cities
                      //                       .firstWhere(
                      //                         (element) =>
                      //                             element.name == e,
                      //                       )
                      //                       .id
                      //                       .toString(),
                      //                 ),
                      //               );
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     /// Али алып тастау керек деп айтты. фильтр кнопка
                      //     // SvgPicture.asset(
                      //     //   "assets/images/svg/filter.svg",
                      //     //   color: ColorPalette.main,
                      //     // ),
                      //     // const SizedBox(
                      //     //   width: 22,
                      //     // ),
                      //     SvgPicture.asset(
                      //       "assets/images/svg/notifications.svg",
                      //       color: ColorPalette.main,
                      //     ),
                      //   ],
                      // )
                      //   ],
                      // ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          splashRadius: 30,
                          onPressed: () {
                            AppRouter.push(
                              context,
                              const NotificationsPage(),
                              rootNavigator: true,
                            );
                          },
                          icon: SvgPicture.asset(
                            "assets/images/svg/notifications.svg",
                            color: ColorPalette.main,
                          ),
                        ),
                      ),

                      // const SizedBox(
                      //   height: 23,
                      // ),
                      // if (kDebugMode)
                      //   GestureDetector(
                      //     child: const Text("Map test"),
                      //     onTap: () {
                      //       // AppRouter.push(context, const DrivingPage(),
                      //       //     rootNavigator: true);
                      //       AppRouter.push(
                      //           context,
                      //           BlocProvider(
                      //             create: (_) => MapCubit(
                      //                 mapRepository: MapRepository(),
                      //                 repository:
                      //                     context.read<GlobalRepository>()),
                      //             child: SessionPage(
                      //               orderId: 5,
                      //             ),
                      //           ),
                      //           rootNavigator: true);
                      //     },
                      //   ),
                      // const SizedBox(
                      //   height: 23,
                      // ),
                      Expanded(
                        child:
                            //  Column(
                            //   children: [
                            // TODO пройти верификацию
                            // Container(
                            //   padding: const EdgeInsets.all(15),
                            //   decoration: BoxDecoration(
                            //     color: ColorPalette.commonBlue,
                            //     borderRadius: BorderRadius.circular(10),
                            //   ),
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Container(
                            //         padding: const EdgeInsets.all(8),
                            //         decoration: BoxDecoration(
                            //           color: ColorPalette.main,
                            //           borderRadius:
                            //               BorderRadius.circular(10),
                            //         ),
                            //         child: SvgPicture.asset(
                            //           "assets/images/svg/user_confirmation.svg",
                            //         ),
                            //       ),
                            //       const SizedBox(
                            //         height: 15,
                            //       ),
                            //       Text(
                            //         S.of(context).confirm_identity,
                            //         style: ProjectTextStyles.ui_20Medium,
                            //         textAlign: TextAlign.center,
                            //       ),
                            //       const SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //         S.of(context).get_access,
                            //         style: ProjectTextStyles.ui_16Medium
                            //             .copyWith(
                            //           color: ColorPalette.darkGrey,
                            //         ),
                            //         textAlign: TextAlign.center,
                            //       ),
                            //       const SizedBox(
                            //         height: 15,
                            //       ),
                            //       GestureDetector(
                            //         onTap: () {
                            //           AppRouter.push(
                            //             context,
                            //             const PersonalInfoVerification(),
                            //             rootNavigator: true,
                            //           ).then((value) {
                            //             context
                            //                 .read<BlocVerification>()
                            //                 .add(
                            //                     EventInitialVerification());
                            //           });
                            //         },
                            //         child: Container(
                            //           padding: const EdgeInsets.symmetric(
                            //             vertical: 16,
                            //           ),
                            //           decoration: BoxDecoration(
                            //             color: ColorPalette.main,
                            //             borderRadius:
                            //                 BorderRadius.circular(10),
                            //           ),
                            //           child: Stack(
                            //             children: [
                            //               Center(
                            //                 child: Text(
                            //                   S.of(context).do_verification,
                            //                   style: ProjectTextStyles
                            //                       .ui_16Medium
                            //                       .copyWith(
                            //                     color: Colors.white,
                            //                   ),
                            //                 ),
                            //               ),
                            //               Positioned(
                            //                 top: 3,
                            //                 right: 15,
                            //                 child: SvgPicture.asset(
                            //                   "assets/images/svg/arrow_right.svg",
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //       // MainButton(
                            //       //   onTap: () {},
                            //       //   title: S.of(context).do_verification,
                            //       // )
                            //     ],
                            //   ),
                            // ),

                            (state.orders.isEmpty)
                                ? LiquidPullToRefresh(
                                    color: ColorPalette.background,
                                    backgroundColor: ColorPalette.main,
                                    key: _refreshIndicatorKey,
                                    onRefresh: _handleRefresh,
                                    showChildOpacityTransition: false,
                                    child: ListView(
                                      shrinkWrap: true,
                                      // physics:
                                      //     const NeverScrollableScrollPhysics(),
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                        ),
                                        Center(
                                          child: Text(
                                            S.of(context).no_orders,
                                            style: ProjectTextStyles.ui_16Medium
                                                .copyWith(
                                              color: ColorPalette.commonGrey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : LiquidPullToRefresh(
                                    color: ColorPalette.background,
                                    backgroundColor: ColorPalette.main,
                                    key: _refreshIndicatorKey,
                                    onRefresh: _handleRefresh,
                                    showChildOpacityTransition: false,
                                    child: ListView.builder(
                                      // physics:
                                      //     const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      padding:
                                          const EdgeInsets.only(bottom: 100),
                                      itemCount: state.orders.length,
                                      itemBuilder: (context, index) {
                                        return _OrderItemWidget(
                                          order: state.orders[index],
                                        );
                                      },
                                    ),
                                  ),
                        //   ],
                        // ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    BlocProvider.of<OrdersBloc>(context).add(
      EventInitialOrdersScreen(),
    );
    final Completer<void> completer = Completer<void>();

    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });

    return completer.future;
    // .then<void>((_) {
    //   ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
    //     SnackBar(
    //       content: const Text('Refresh complete'),
    //       action: SnackBarAction(
    //         label: 'RETRY',
    //         onPressed: () {
    //           _refreshIndicatorKey.currentState!.show();
    //         },
    //       ),
    //     ),
    //   );
    // });
  }
}

class _OrderItemWidget extends StatefulWidget {
  final OrderDTO order;
  // final int cityId;

  const _OrderItemWidget({
    Key? key,
    required this.order,
    // required this.cityId,
  }) : super(key: key);

  @override
  State<_OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<_OrderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: GestureDetector(
        onTap: () {
          AppRouter.push(
            context,
            // OrderDetailPage(
            //   order: widget.order,
            // ),
            OrderDetailPage(
              order: widget.order,
            ),
            rootNavigator: true,
          );
          // .then( // TODO
          //   (value) => context.read<OrdersBloc>().add(
          //         EventInitialOrdersScreen(),
          //       ),
          // );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: ColorPalette.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Дата выезда",
                    style: ProjectTextStyles.ui_12Medium
                        .copyWith(color: ColorPalette.commonGrey),
                  ),
                  Text(
                    widget.order.startDate!=null?
                    DateFormat("dd MMMM, HH:mm").format(widget.order.startDate!):"",
                    style: ProjectTextStyles.ui_12Medium
                        .copyWith(color: ColorPalette.commonGrey),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      //widget.order.employee?.name ?? S.of(context).no_data,
                      '0000000${widget.order.id}',

                      style: ProjectTextStyles.ui_20Medium,
                    ),
                  ),
                  if (widget.order.status?.toLowerCase() == "accepted" ||
                      widget.order.status?.toLowerCase() == "in_process" ||
                      widget.order.status?.toLowerCase() == "stopped")
                    Container(
                      decoration: BoxDecoration(
                        color: ColorPalette.grey400,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "Текущий Заказ",
                        style: ProjectTextStyles.ui_10Regular.copyWith(
                          color: ColorPalette.white,
                        ),
                      ),
                    )
                ],
              ),

              ///
              ///
              /// Убираем карту с карточки заказа на главной странице
              ///
              ///
              // if (widget.order.status?.toLowerCase() == "accepted" ||
              //     widget.order.status?.toLowerCase() == "in_process" ||
              //     widget.order.status?.toLowerCase() == "stopped")
              //   Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 12.0),
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(16),
              //       child: Container(
              //         width: double.infinity,
              //         height: 160,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(16),
              //         ),
              //         child: Stack(
              //           children: [
              //             BlocProvider(
              //               create: (_) => MapCubit(
              //                 mapRepository: MapRepository(),
              //                 repository: context.read<GlobalRepository>(),
              //               ),
              //               child: SessionPage(
              //                 orderId: widget.order.id!,
              //                 orderData: widget.order,
              //               ),
              //             ),
              //             // const YandexMap(
              //             //   tiltGesturesEnabled: false,
              //             //   zoomGesturesEnabled: false,
              //             //   rotateGesturesEnabled: false,
              //             //   scrollGesturesEnabled: false,
              //             //   modelsEnabled: false,
              //             // ),
              //             Positioned(
              //               right: 5,
              //               top: 5,
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   color: ColorPalette.white,
              //                   borderRadius: BorderRadius.circular(40),
              //                 ),
              //                 padding: const EdgeInsets.symmetric(
              //                   vertical: 4.5,
              //                   horizontal: 8,
              //                 ),
              //                 child: Row(
              //                   children: [
              //                     Container(
              //                       height: 6,
              //                       width: 6,
              //                       decoration: BoxDecoration(
              //                         color: ColorPalette.red,
              //                         borderRadius: BorderRadius.circular(100),
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       width: 5,
              //                     ),
              //                     const Text(
              //                       "LIVE",
              //                       style: ProjectTextStyles.ui_12Medium,
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),

              const Divider(
                thickness: 1,
                color: ColorPalette.lightGrey,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.order.status?.toLowerCase() == "accepted" ||
                              widget.order.status?.toLowerCase() ==
                                  "in_process" ||
                              widget.order.status?.toLowerCase() == "stopped"
                          ? ColorPalette.main
                          : ColorPalette.grey400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset("assets/images/svg/orders_geo.svg"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.order.from ?? S.of(context).no_data,
                        style: ProjectTextStyles.ui_16Medium,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: DottedLine(
                  direction: Axis.vertical,
                  dashColor: ColorPalette.commonGrey,
                  lineLength: 25,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorPalette.lightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/svg/orders_geo_done.svg",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.order.to ?? S.of(context).no_data,
                        style: ProjectTextStyles.ui_16Medium,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      // Text(
                      //   widget.order.to ?? S.of(context).no_data,
                      //   style: ProjectTextStyles.ui_12Medium
                      //       .copyWith(color: ColorPalette.commonGrey),
                      // ),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
                color: ColorPalette.lightGrey,
              ),
              // _BuildImages(),
              // Text(
              //   widget.order.description ?? S.of(context).no_data,
              //   style: ProjectTextStyles.ui_16Medium.copyWith(
              //     color: ColorPalette.darkGrey,
              //   ),
              //   maxLines: 2,
              //   overflow: TextOverflow.ellipsis,
              // ),
              // const Divider(
              //   thickness: 2,
              //   color: ColorPalette.lightGrey,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Способ оплаты",
              //       style: ProjectTextStyles.ui_12Medium
              //           .copyWith(color: ColorPalette.darkGrey),
              //     ),
              //     Text(
              //       widget.order.payment ?? S.of(context).no_data,
              //       style: ProjectTextStyles.ui_12Medium
              //           .copyWith(color: ColorPalette.main),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _BuildImages extends StatelessWidget {
//   const _BuildImages({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<String> images = [
//       "assets/images/png/test_orders_1.png",
//       "assets/images/png/test_orders_2.png",
//       "assets/images/png/test_orders_3.png",
//       "assets/images/png/test_orders_4.png",
//     ];
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       height: 72,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12.0),
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           shrinkWrap: true,
//           itemCount: images.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(right: 2.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.asset(
//                   images[index],
//                   width: 48,
//                   height: 48,
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
