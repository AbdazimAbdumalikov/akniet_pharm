import 'package:europharm_flutter/main/login_bloc/login_bloc.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:europharm_flutter/network/services/firebase_messaging_repository.dart';
import 'package:europharm_flutter/network/tokens_repository/tokens_repository.dart';
import 'package:europharm_flutter/screens/auth/bloc/bloc_auth.dart';
import 'package:europharm_flutter/screens/bottom_navigation_bar/cubit/bottom_nav_bar_cubit.dart';
import 'package:europharm_flutter/screens/documents_screen/bloc/bloc_documents_screen.dart';
import 'package:europharm_flutter/screens/notifications_screen/bloc/notifications_bloc.dart';
import 'package:europharm_flutter/screens/order_card/bloc/empty_drivers_cubit.dart';
import 'package:europharm_flutter/screens/order_card/bloc/order_detail_bloc.dart';
import 'package:europharm_flutter/screens/orders_screen/bloc/orders_bloc.dart';
import 'package:europharm_flutter/screens/personal_data_screen/bloc/bloc_personal_data.dart';
import 'package:europharm_flutter/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:europharm_flutter/screens/ride_history_screen/bloc/bloc_ride_history.dart';
import 'package:europharm_flutter/screens/schedule_screen/bloc/calendar_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Providers for global blocs
class TopLevelBlocs extends StatelessWidget {
  final Widget child;

  const TopLevelBlocs({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            context.read<TokensRepository>(),
          )..add(InitialLoginEvent()),
        ),
        BlocProvider(
          create: (context) => BlocAuth(
            repository: context.read<GlobalRepository>(),
            firebaseMessagingRepository:
                context.read<FirebaseMessagingRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => BottomNavBarCubit(),
        ),
        // BlocProvider(
        //   create: (context) => BlocVerification(
        //     repository: context.read<GlobalRepository>(),
        //   )..add(EventInitialVerification()),
        // ),
        BlocProvider(
          create: (context) => BlocRideHistory(
            repository: context.read<GlobalRepository>(),
          )..add(EventReadRideHistory()),
        ),
        BlocProvider(
          create: (context) => BlocDocumentsScreen(
            repository: context.read<GlobalRepository>(),
          )..add(EventInitialDocumentsScreen()),
        ),
        // BlocProvider(
        //   create: (context) => BlocOrdersScreen(
        //     repository: context.read<GlobalRepository>(),
        //   )..add(EventInitialOrdersScreen(cityId: "1")),
        // ),
        BlocProvider(
          create: (context) => ProfileBloc(
            repository: context.read<GlobalRepository>(),
            firebaseMessagingRepository:
                context.read<FirebaseMessagingRepository>(),
          )..add(ProfileEventInitial()),
        ),
        BlocProvider(
          create: (context) => BlocPersonalData(
            repository: context.read<GlobalRepository>(),
          )..add(EventInitialPersonalData()),
        ),
        BlocProvider<EmptyDriversCubit>(
          create: (context) => EmptyDriversCubit(
            globalRepository: context.read<GlobalRepository>(),
          ),
        ),

        BlocProvider<NotificationsBloc>(
          create: (context) => NotificationsBloc(
            globalRepository: context.read<GlobalRepository>(),
          ),
        ),

        BlocProvider<OrdersBloc>(
          create: (context) => OrdersBloc(
            repository: context.read<GlobalRepository>(),
          )..add(
              EventInitialOrdersScreen(cityId: "23"),
            ),
        ),

        BlocProvider<OrderDetailBloc>(
          create: (context) => OrderDetailBloc(
            repository: context.read<GlobalRepository>(),
          ),
        ),

        BlocProvider<CalendarOrdersCubit>(
          create: (context) => CalendarOrdersCubit(
            globalRepository: context.read<GlobalRepository>(),
          ),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(
            repository: context.read<GlobalRepository>(),
            firebaseMessagingRepository:
                context.read<FirebaseMessagingRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
