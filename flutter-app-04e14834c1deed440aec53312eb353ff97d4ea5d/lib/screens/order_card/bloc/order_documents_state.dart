part of 'order_documents_bloc.dart';

@immutable
abstract class OrderDocumentsState {}

class OrderDocumentsInitial extends OrderDocumentsState {}

class OrderDocumentsIsLoadingState extends OrderDocumentsState {}

class OrderDocumentsIsLoadedState extends OrderDocumentsState {
  final List<OrderDocuments> documents;

  OrderDocumentsIsLoadedState({required this.documents});
}

class OrderDocumentsLoadingErrorState extends OrderDocumentsState {
  final AppError error;

  OrderDocumentsLoadingErrorState({
    required this.error,
  });
}
