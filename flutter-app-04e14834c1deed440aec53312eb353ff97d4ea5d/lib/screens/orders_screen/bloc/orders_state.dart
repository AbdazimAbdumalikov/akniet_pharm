part of 'orders_bloc.dart';

@immutable
abstract class OrdersState {}

class OrdersStateLoading extends OrdersState {}

class StateLoadDataOrdersScreen extends OrdersState {
  final List<OrderDTO> orders;
  final List<CityData> cities;

  StateLoadDataOrdersScreen({
    required this.orders,
    required this.cities,
  });
}

class StateOrdersScreenError extends OrdersState {
  final AppError error;

  StateOrdersScreenError({
    required this.error,
  });
}
