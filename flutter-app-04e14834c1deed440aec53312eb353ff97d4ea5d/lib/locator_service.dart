// import 'package:europharm_flutter/main/login_bloc/login_bloc.dart';
// import 'package:europharm_flutter/managers/user_store.dart';
// import 'package:europharm_flutter/network/dio_wrapper/dio_wrapper.dart';
// import 'package:europharm_flutter/network/repository/global_repository.dart';
// import 'package:europharm_flutter/network/repository/hive_repository.dart';
// import 'package:europharm_flutter/network/services/network_service.dart';
// import 'package:europharm_flutter/network/tokens_repository/tokens_repository.dart';
// import 'package:get_it/get_it.dart';

// final sl = GetIt.instance;
// const String baseUrl = 'http://185.129.50.172/api/v1/';

// Future<void> initLocator() async {
//   sl.registerLazySingletonAsync(() async => HiveRepository()..init());
//   sl.registerLazySingletonAsync(() async => UserStore()..init(sl()));
//   sl.registerLazySingletonAsync(() async => TokensRepository()..init(sl()));
//   sl.registerLazySingleton(() => NetworkService()..init(sl()));
//   sl.registerLazySingleton(() => GlobalRepository()..init(sl(), sl()));
//   sl.registerLazySingletonAsync(
//     () async => DioWrapper()
//       ..init(
//         baseURL: baseUrl,
//         globalRepository: sl(),
//         loginBloc: sl(),
//         tokensRepository: sl(),
//       ),
//   );

//   sl.registerFactory(() => LoginBloc(sl())..add(InitialLoginEvent()));
// }
