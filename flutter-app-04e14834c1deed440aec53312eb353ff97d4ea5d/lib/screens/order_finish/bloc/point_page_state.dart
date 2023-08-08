part of 'point_page_bloc.dart';

@immutable
abstract class PointPageState {}

class PointPageStateLoading extends PointPageState {}

class PointPageStateLoaded extends PointPageState {
  final PointDTO orderPoint;
  final bool areAllFinished;

  PointPageStateLoaded({
    required this.orderPoint,
    this.areAllFinished = false,
  });
}

class PointPageStateFinished extends PointPageState {}

// class StateLoadPointWithoutScan extends PointPageState {
//   final OrderPoint orderPoint;
//   final bool areAllFinished;

//   StateLoadPointWithoutScan({
//     required this.orderPoint,
//     this.areAllFinished = false,
//   });
// }

class PointPageStateError extends PointPageState {
  final AppError error;

  PointPageStateError({
    required this.error,
  });
}
