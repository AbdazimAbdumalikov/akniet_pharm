import 'package:europharm_flutter/network/models/order_dto.dart';
import 'package:europharm_flutter/screens/order_finish/bloc/point_page_bloc.dart';
import 'package:europharm_flutter/screens/order_finish/ui/scan_barcode_page.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/utils/app_router.dart';
import 'package:europharm_flutter/widgets/app_bottom_sheets/app_bottom_sheet.dart';
import 'package:europharm_flutter/widgets/app_bottom_sheets/app_dialog.dart';
import 'package:europharm_flutter/widgets/app_loader_overlay.dart';
import 'package:europharm_flutter/widgets/main_button/main_button.dart';
import 'package:europharm_flutter/widgets/main_text_field/app_text_field.dart';
import 'package:europharm_flutter/widgets/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ScanChoosePage extends StatefulWidget {
  final OrderDTO order;
  final PointPageBloc pointPageBloc;

  const ScanChoosePage({
    Key? key,
    required this.order,
    required this.pointPageBloc,
  }) : super(key: key);

  @override
  State<ScanChoosePage> createState() => _ScanChoosePageState();
}

class _ScanChoosePageState extends State<ScanChoosePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.pointPageBloc,
      child: AppLoaderOverlay(
        child: BlocConsumer<PointPageBloc, PointPageState>(
          listener: (context, state) {
            if (state is PointPageStateError) {
              showAppDialog(
                context,
                title: state.error.message,
                onTap: () => Navigator.pop(context),
              );
            }
            if (state is PointPageStateLoaded) {
              showCustomSnackbar(
                context,
                'Успешно отсканировано!',
                color: ColorPalette.green,
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0.7),
              appBar: AppBar(
                backgroundColor: const Color.fromRGBO(0, 0, 0, 0.7),
                centerTitle: true,
                title: const Text(
                  "ФОТО",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                elevation: 0,
                leading: IconButton(
                  icon: SvgPicture.asset(
                    "assets/images/svg/arrow_back.svg",
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Выберите способ сканирования',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRouter.push(
                            context,
                            ScanBarcodePage(
                              pointPageBloc:
                                  BlocProvider.of<PointPageBloc>(context),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: ColorPalette.main,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  "Сфотографировать",
                                  style: ProjectTextStyles.ui_16Medium.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 18,
                                top: 0,
                                bottom: 0,
                                child: SvgPicture.asset(
                                  "assets/images/svg/camera_photo_select.svg",
                                  color: ColorPalette.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Или',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          showBarcodeEnterDialog(
                            context,
                            (code) => context.read<PointPageBloc>().add(
                                  PointPageEventScanBarcode(
                                    code: code.toString(),
                                  ),
                                ),
                          );
                          //  Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: ColorPalette.main,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  "Ручной сканнер",
                                  style: ProjectTextStyles.ui_16Medium.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 18,
                                top: 0,
                                bottom: 0,
                                child: SvgPicture.asset(
                                  "assets/images/svg/scan.svg",
                                  color: ColorPalette.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void showBarcodeEnterDialog(BuildContext context, Function onScan) {
  showAppBottomSheet(
    context,
    initialChildSize: 0.45,
    useRootNavigator: true,
    child: BuildBarcodeEnterField(onScan: onScan),
  );
}

class BuildBarcodeEnterField extends StatefulWidget {
  final Function onScan;

  const BuildBarcodeEnterField({Key? key, required this.onScan})
      : super(key: key);

  @override
  _BuildBarcodeEnterField createState() => _BuildBarcodeEnterField();
}

class _BuildBarcodeEnterField extends State<BuildBarcodeEnterField> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Введите код",
            style: ProjectTextStyles.ui_20Medium,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextField(
            controller: controller,
            hintStyle: ProjectTextStyles.ui_16Medium.copyWith(
              color: ColorPalette.commonGrey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MainButton(
            title: "Подтвердить",
            onTap: () {
              Navigator.pop(context, controller.text);
              widget.onScan(controller.text);
            },
          )
        ],
      ),
    );
  }
}
