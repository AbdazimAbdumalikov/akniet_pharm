import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:europharm_flutter/network/models/dto_models/response/error.dart';
import 'package:europharm_flutter/network/models/order_documents.dart';
import 'package:europharm_flutter/network/models/user_dto.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'order_documents_event.dart';
part 'order_documents_state.dart';

const _tag = 'order_documents_page.dart';

class OrderDocumentsBloc
    extends Bloc<OrderDocumentsEvent, OrderDocumentsState> {
  OrderDocumentsBloc({
    required this.repository,
    required this.orderId,
  }) : super(OrderDocumentsInitial()) {
    on<OrderDocumentsInitialEvent>(_getDocuments);
    on<OrderDocumentsDownloadFileEvent>(_downloadFile);
    on<OrderDocumentsSignEvent>(_signFile);
    add(OrderDocumentsInitialEvent());
  }

  final GlobalRepository repository;
  final int orderId;

  _getDocuments(OrderDocumentsInitialEvent event,
      Emitter<OrderDocumentsState> emit) async {
    try {
      emit(OrderDocumentsIsLoadingState());
      final UserDTO profile = await repository.getProfile();
      List<OrderDocuments> documents = await repository.getOrderDocuments(
          orderId: orderId, userId: profile.id);
      emit(OrderDocumentsIsLoadedState(documents: documents));
    } on DioError catch (e) {
      log('$e', name: _tag);
      emit(
        OrderDocumentsLoadingErrorState(
          error: AppError(
              message:
                  "${e.response?.data?['message']} (_getDocuments method)"),
        ),
      );
    }
  }

  _downloadFile(OrderDocumentsDownloadFileEvent event,
      Emitter<OrderDocumentsState> emit) async {
    launch(event.url);
  }

  _signFile(
      OrderDocumentsSignEvent event, Emitter<OrderDocumentsState> emit) async {
    launch(event.url);
  }
}
