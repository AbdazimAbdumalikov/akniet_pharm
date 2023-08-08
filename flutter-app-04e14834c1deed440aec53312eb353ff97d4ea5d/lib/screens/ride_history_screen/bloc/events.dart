part of 'bloc_ride_history.dart';

@immutable
abstract class EventBlocRideHistory {}

class EventReadRideHistory extends EventBlocRideHistory {
  DateTime? from;
  DateTime? to;

  EventReadRideHistory({
    this.from,
    this.to,
  });
}
