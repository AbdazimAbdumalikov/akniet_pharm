part of 'order_documents_bloc.dart';

@immutable
abstract class OrderDocumentsEvent {}

class OrderDocumentsInitialEvent extends OrderDocumentsEvent {}

class OrderDocumentsDownloadFileEvent extends OrderDocumentsEvent {
  final String url;
  OrderDocumentsDownloadFileEvent({required this.url});
}

class OrderDocumentsSignEvent extends OrderDocumentsEvent {
  final String url;
  OrderDocumentsSignEvent({required this.url});
}
