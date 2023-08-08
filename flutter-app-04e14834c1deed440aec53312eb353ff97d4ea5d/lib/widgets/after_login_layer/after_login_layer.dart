import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:europharm_flutter/network/repository/hive_repository.dart';
import 'package:europharm_flutter/network/tokens_repository/tokens_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/after_login_layer_bloc.dart';

class AfterLoginLayer extends StatelessWidget {
  const AfterLoginLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AfterLoginLayerBloc>(
      create: (context) => AfterLoginLayerBloc(
        context.read<GlobalRepository>(),
        context.read<TokensRepository>(),
        S.current,
        context.read<HiveRepository>(),
      )..add(InitialAfterLoginEvent()),
      child: const Center(
        child: Text("Authorized"),
      ),
    );
  }
}
