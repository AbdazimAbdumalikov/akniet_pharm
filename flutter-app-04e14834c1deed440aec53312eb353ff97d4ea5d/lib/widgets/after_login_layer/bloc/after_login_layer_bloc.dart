import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:europharm_flutter/network/repository/hive_repository.dart';
import 'package:europharm_flutter/network/tokens_repository/tokens_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'after_login_layer_event.dart';

part 'after_login_layer_state.dart';

class AfterLoginLayerBloc
    extends Bloc<AfterLoginLayerEvent, AfterLoginLayerState> {
  // ignore: unused_field
  final GlobalRepository _repository;
  // ignore: unused_field
  final TokensRepository _tokensRepository;
  // ignore: unused_field
  final S _lang;
  // ignore: unused_field
  final HiveRepository _hiveRepository;

  AfterLoginLayerBloc(
    this._repository,
    this._tokensRepository,
    this._lang,
    this._hiveRepository,
  ) : super(LoadingAfterLoginState()) {
    on<InitialAfterLoginEvent>(_onInitialAfterLoginEvent);
  }

  _onInitialAfterLoginEvent(
      InitialAfterLoginEvent event, Emitter<AfterLoginLayerState> emit) async {
    try {} catch (error) {
      if (kDebugMode) {
        rethrow;
      }
      emit(ErrorAfterLoginState(error));
    }
  }
}
