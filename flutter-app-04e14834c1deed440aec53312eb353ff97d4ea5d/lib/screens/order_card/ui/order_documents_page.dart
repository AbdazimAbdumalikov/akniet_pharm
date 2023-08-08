import 'package:europharm_flutter/network/models/order_documents.dart';
import 'package:europharm_flutter/network/models/order_dto.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:europharm_flutter/screens/order_card/bloc/order_documents_bloc.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/widgets/app_bottom_sheets/app_bottom_sheet.dart';
import 'package:europharm_flutter/widgets/app_loader_overlay.dart';
import 'package:europharm_flutter/widgets/main_button/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderDocumentsPage extends StatelessWidget {
  final OrderDTO order;
  const OrderDocumentsPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDocumentsBloc(
          repository: context.read<GlobalRepository>(), orderId: order.id),
      child: BlocConsumer<OrderDocumentsBloc, OrderDocumentsState>(
        listener: (context, state) {
          if (state is OrderDocumentsIsLoadingState) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
        },
        builder: (context, state) {
          return AppLoaderOverlay(
            child: Scaffold(
              backgroundColor: ColorPalette.white,
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  "Документы",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                elevation: 0,
                leading: IconButton(
                  icon: SvgPicture.asset(
                    "assets/images/svg/arrow_back.svg",
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ),
              body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: state is OrderDocumentsIsLoadedState
                    ? ListView.builder(
                        itemCount: state.documents.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                  "${state.documents[index].name ?? ''} №${state.documents[index].id}",
                                  style: ProjectTextStyles.ui_16Medium,
                                ),
                                trailing: Text(
                                  "${state.documents[index].status == 0 ? 'Не подписан' : 'Подписан'}",
                                  style: ProjectTextStyles.ui_14Regular,
                                ),
                                onTap: () {
                                  showAppBottomSheet(
                                    context,
                                    initialChildSize: 0.45,
                                    useRootNavigator: true,
                                    child: BlocProvider.value(
                                      value: context.read<OrderDocumentsBloc>(),
                                      child: BuildChooseDocumentAction(
                                          document: state.documents[index]),
                                    ),
                                  );
                                },
                              ),
                              const Divider()
                            ],
                          );
                        })
                    : const SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BuildChooseDocumentAction extends StatelessWidget {
  const BuildChooseDocumentAction({Key? key, required this.document})
      : super(key: key);
  final OrderDocuments document;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OrderDocumentsBloc>();
    return BlocBuilder<OrderDocumentsBloc, OrderDocumentsState>(
      bloc: bloc,
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Center(
                child: Text(
                  "Выберите действие",
                  style: ProjectTextStyles.ui_20Medium,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainButton(
                    width: MediaQuery.of(context).size.width * 0.4,
                    title: "Скачать",
                    iconColor: ColorPalette.white,
                    onTap: () {
                      if (document.url != null) {
                        bloc.add(OrderDocumentsDownloadFileEvent(
                            url: document.url!));
                        Navigator.pop(context);
                      }
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MainButton(
                    width: MediaQuery.of(context).size.width * 0.4,
                    title: "Подписать",
                    iconColor: ColorPalette.white,
                    onTap: () {
                      if (document.urlEgov != null && document.status == 0) {
                        bloc.add(
                            OrderDocumentsSignEvent(url: document.urlEgov!));
                        bloc.add(OrderDocumentsInitialEvent());
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
