part of 'bloc_ride_history.dart';

@immutable
abstract class StateBlocRideHistory {}

class StateRideHistoryInitial extends StateBlocRideHistory {}

class StateLoadRideHistory extends StateBlocRideHistory {
  final List<OrderHistoryData> history;
  final int finishedLength;
  final int declinedLength;
  final DateTime from;
  final DateTime to;

  StateLoadRideHistory( {
    required this.declinedLength,
    required this.finishedLength,
    required this.history,
    required this.from,
    required this.to,
  });
}
