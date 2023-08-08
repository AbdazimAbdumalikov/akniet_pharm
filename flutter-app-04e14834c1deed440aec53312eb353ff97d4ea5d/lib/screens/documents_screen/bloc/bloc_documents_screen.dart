import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../network/repository/global_repository.dart';

part 'events.dart';
part 'states.dart';
part 'parts/read.dart';

class BlocDocumentsScreen extends Bloc<EventBlocDocumentsScreen, StateBlocDocumentsScreen> {
  BlocDocumentsScreen({
    required this.repository,
  }) : super(StateLoadingDocumentsScreen()) {
    on<EventInitialDocumentsScreen>(_read);
  }

  final GlobalRepository repository;

}
