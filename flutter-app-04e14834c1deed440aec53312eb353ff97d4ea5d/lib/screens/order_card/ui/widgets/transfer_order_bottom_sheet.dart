import 'dart:developer';

import 'package:europharm_flutter/network/models/dto_models/response/error.dart';
import 'package:europharm_flutter/network/models/user_dto.dart';
import 'package:europharm_flutter/screens/order_card/bloc/empty_drivers_cubit.dart';
import 'package:europharm_flutter/screens/order_card/ui/widgets/employer_card_widget.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/widgets/app_bottom_sheets/knob.dart';
import 'package:europharm_flutter/widgets/main_button/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _tag = 'TransferOrderBottomSheet';

class TransferOrderBottomSheet extends StatefulWidget {
  const TransferOrderBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<TransferOrderBottomSheet> createState() =>
      _TransferOrderBottomSheetState();
}

class _TransferOrderBottomSheetState extends State<TransferOrderBottomSheet> {
  TextEditingController textEditingController = TextEditingController();
  UserDTO? chosenDriver;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
//      create: (context) => widget.bloc,

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Knob(),
                  const SizedBox(height: 20),
                  const Text(
                    "Передать заказ другому водителю",
                    style: ProjectTextStyles.ui_20Medium,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: CupertinoSearchTextField(
                      onChanged: (value) {
                        if (textEditingController.text.isEmpty) {
                          BlocProvider.of<EmptyDriversCubit>(context)
                              .getEmptyDrivers();
                        } else {
                          BlocProvider.of<EmptyDriversCubit>(context)
                              .searchDrivers(
                            searchText: textEditingController.text,
                          );
                        }
                      },
                      onSubmitted: (value) {
                        if (textEditingController.text.isEmpty) {
                          BlocProvider.of<EmptyDriversCubit>(context)
                              .getEmptyDrivers();
                        } else {
                          BlocProvider.of<EmptyDriversCubit>(context)
                              .searchDrivers(
                            searchText: textEditingController.text,
                          );
                        }
                      },
                      controller: textEditingController,
                    ),
                  ),
                  Expanded(
                    child: BlocConsumer<EmptyDriversCubit, EmptyDriversState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          errorState: (AppError error) {
                            log("${error.code} ${error.message}", name: _tag);
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          loadedState: (List<UserDTO> drivers) {
                            return ListView.separated(
                              itemCount: drivers.length,
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    top: 8.0,
                                    bottom:
                                        drivers.length - 1 == index ? 60 : 8,
                                  ),
                                  child: EmployerCard(
                                    driver: drivers[index],
                                    isChosen: chosenDriver != null &&
                                        drivers[index].id == chosenDriver!.id,
                                    callBack: ({required UserDTO emptyDriver}) {
                                      setState(() {
                                        chosenDriver = emptyDriver;
                                      });
                                    },
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 1,
                                  height: 2,
                                  color: ColorPalette.lightGrey,
                                );
                              },
                            );
                          },
                          orElse: () {
                            return const SizedBox(
                              height: 400,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 16,
              right: 16,
              child: Center(
                child: MainButton(
                  onTap: () {
                    if (chosenDriver != null) {
                      // context.read<BlocOrderCard>().add(
                      //       EventStopOrder(
                      //         cause: "change_driver",
                      //         emptyDriver: chosenDriver,
                      //       ),
                      //     );
                      Navigator.pop(context, chosenDriver);
                    }
                  },
                  title: "Готово",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
