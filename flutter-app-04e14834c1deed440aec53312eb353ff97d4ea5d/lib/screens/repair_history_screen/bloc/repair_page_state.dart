part of 'repair_page_bloc.dart';

@immutable
abstract class RepairPageState {}

class RepairPageInitial extends RepairPageState {}

class RepairPageIsLoadingState extends RepairPageState {
  final List<Repairs> repairs;

  RepairPageIsLoadingState({required this.repairs});
}

class RepairPageIsLoadedState extends RepairPageState {
  final List<Repairs> repairs;

  RepairPageIsLoadedState({required this.repairs});
}

class RepairPageLoadingErrorState extends RepairPageState {
  final AppError error;

  RepairPageLoadingErrorState({
    required this.error,
  });
}
