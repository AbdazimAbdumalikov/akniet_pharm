part of '../bloc_ride_history.dart';

extension Read on BlocRideHistory {
  Future<void> _read(
    EventReadRideHistory event,
    Emitter<StateBlocRideHistory> emit,
  ) async {
    try {
      if (event.from != null || event.to != null) {
        emit(StateRideHistoryInitial());
      }
      var historyData = await repository.orderHistory(
          DateFormat("yyyy-dd-MM").format(
              event.from ?? DateTime.now().subtract(const Duration(days: 31))),
          DateFormat("yyyy-dd-MM").format(event.to ?? DateTime.now()));

      List<OrderHistoryData> filteredHistory = historyData.data ?? [];
      if (filteredHistory.isNotEmpty) {
        filteredHistory.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      //  log('hello');
        for (int i = 0; i < filteredHistory.length - 1; i++) {
          if (!filteredHistory[i]
              .createdAt!
              .isEquals(filteredHistory[i + 1].createdAt!)) {
            filteredHistory[i].showTime = true;
          }
        }

        if (filteredHistory.length > 1 &&
            filteredHistory[0]
                .createdAt!
                .isEquals(filteredHistory[1].createdAt!)) {
          filteredHistory[1].showTime = false;
          filteredHistory[0].showTime = true;
        }
        if (filteredHistory.length == 1) {
          filteredHistory[0].showTime = true;
        }
      }

      int finishedLength = 0;
      int declinedLength = 0;
      for(final OrderHistoryData data in  filteredHistory ){
        if(data.orderStatus=="finished"){
          finishedLength++;
        }else if(data.orderStatus=="declined"){
          declinedLength++;
        }
      }
      emit(StateLoadRideHistory(
        history: filteredHistory,
        finishedLength: finishedLength,
        declinedLength: declinedLength,
        from: event.from ?? DateTime.now().subtract(const Duration(days: 31)),
        to: event.to ?? DateTime.now(),
      ));
    } catch (e) {
      log('$e', name: _tag);
    }
  }
}
