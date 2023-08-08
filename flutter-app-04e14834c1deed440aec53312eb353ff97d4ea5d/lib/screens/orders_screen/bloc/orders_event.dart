part of 'orders_bloc.dart';

@immutable
abstract class OrdersEvent {}

class EventInitialOrdersScreen extends OrdersEvent {
  final String? cityId;

  EventInitialOrdersScreen({
     this.cityId,
  });
}
