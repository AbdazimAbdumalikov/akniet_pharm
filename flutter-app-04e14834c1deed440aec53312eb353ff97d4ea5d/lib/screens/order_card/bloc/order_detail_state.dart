part of 'order_detail_bloc.dart';

@immutable
abstract class OrderDetailState {}

class OrderDetailStateLoading extends OrderDetailState {}

class OrderDetailStateStopSuccess extends OrderDetailState {}

class OrderDetailStateStartSuccess extends OrderDetailState {}

class OrderDetailStateResumeSuccess extends OrderDetailState {}

class OrderDetailStateChangedDriverOrderCard extends OrderDetailState {}

// class StateLoadOrderDetails extends StateBlocOrderCard {
//   final OrderData order;

//   StateLoadOrderDetails({
//     required this.order,
//   });
// }

class OrderDetailStateLoaded extends OrderDetailState {
  final List<PointDTO> orderPoints;
  final OrderDTO order; // order;

  OrderDetailStateLoaded({
    required this.orderPoints,
    required this.order,
  });
}

class OrderDetailStateShowTimer extends OrderDetailState {
  final DateTime startTimer;
  final bool isForth;

  OrderDetailStateShowTimer({
    required this.startTimer,
    required this.isForth,
  });
}

class OrderDetailStateError extends OrderDetailState {
  final AppError error;

  OrderDetailStateError({
    required this.error,
  });
}

// @freezed
// class BlocOrderCardState with _$BlocOrderCardState {
//   const factory BlocOrderCardState.loadingState() = _LoadingState;

//   const factory BlocOrderCardState.startedState() = _StartedState;

//   const factory BlocOrderCardState.stopedState() = _StopedState;

//   const factory BlocOrderCardState.resumedState() = _ResumedState;

//   const factory BlocOrderCardState.loadedState({

//   }) = _LoadingState;

//   const factory BlocOrderCardState.loadingState() = _LoadingState;

//   const factory BlocOrderCardState.loadingState() = _LoadingState;
// }
