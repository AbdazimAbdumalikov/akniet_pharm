import 'package:europharm_flutter/managers/error_handler/error_handler.dart';
import 'package:europharm_flutter/managers/url_manager/url_manager.dart';
import 'package:europharm_flutter/managers/user_store.dart';
import 'package:europharm_flutter/network/dio_wrapper/dio_wrapper.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:europharm_flutter/network/repository/hive_repository.dart';
import 'package:europharm_flutter/network/services/firebase_messaging_repository.dart';
import 'package:europharm_flutter/network/services/network_service.dart';
import 'package:europharm_flutter/network/tokens_repository/tokens_repository.dart';
import 'package:europharm_flutter/screens/order_card/provider/order_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

///Providers for global managers
class DependenciesProvider extends StatelessWidget {
  final Widget child;

  const DependenciesProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // RepositoryProvider(
        //   create: (_) => SyncSharedPreferences(),
        // ),
        RepositoryProvider(
          create: (_) => DioWrapper(),
        ),
        RepositoryProvider(
          create: (_) => TokensRepository(),
        ),
        RepositoryProvider(
          create: (_) => GlobalRepository(),
        ),
        RepositoryProvider(
          create: (_) => NetworkService(),
        ),
        RepositoryProvider(
          create: (_) => HiveRepository(),
        ),
        RepositoryProvider(
          create: (_) => ErrorHandler(),
        ),
        // RepositoryProvider(
        //   create: (_) => SecureStorage(),
        // ),
        RepositoryProvider(
          create: (_) => FirebaseMessagingRepository(),
        ),
        RepositoryProvider(
          create: (_) => UrlManager(projectBaseUrl),
        ),
        ChangeNotifierProvider(
          create: (_) => UserStore(),
        ),
        ChangeNotifierProvider<OrderDetailProvider>(
          create: (_) => OrderDetailProvider(),
        )
      ],
      child: child,
    );
  }
}
