part of '../point_page_bloc.dart';

extension Finish on PointPageBloc {
  Future<void> _finish(
    PointPageEventProductFinish event,
    Emitter<PointPageState> emit,
  ) async {
    try {
      await repository.orderProductFinish(event.productId, event.code);
      add(PointPageEventLoadProducts(pointId: pointId!));
    } catch (e) {
      emit(
        PointPageStateError(
          error: AppError(
            message: e.dioErrorMessage,
            code: e.dioErrorStatusCode,
          ),
        ),
      );
    }
  }
}
