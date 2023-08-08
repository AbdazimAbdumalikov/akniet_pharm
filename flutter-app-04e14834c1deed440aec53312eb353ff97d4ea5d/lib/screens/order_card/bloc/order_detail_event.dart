part of 'order_detail_bloc.dart';

@immutable
abstract class OrderDetailEvent {}

class OrderDetailEventInitial extends OrderDetailEvent {
  final int orderId;

  OrderDetailEventInitial(this.orderId);
}

class OrderDetailEventStop extends OrderDetailEvent {
  final String cause;
  final int pointId;
  final UserDTO? emptyDriver;

  OrderDetailEventStop({required this.pointId, required this.cause, this.emptyDriver});
}

class OrderDetailEventStart extends OrderDetailEvent {}

class OrderDetailEventResume extends OrderDetailEvent {}

class OrderDetailRefreshEvent extends OrderDetailEvent {
  final int orderId;

  OrderDetailRefreshEvent({
    required this.orderId,
  });
}

class OrderDetailEventReset extends OrderDetailEvent {}

class OrderDetailEventFinishOrder extends OrderDetailEvent {
  final int orderId;

  OrderDetailEventFinishOrder({
    required this.orderId,
  });
}
