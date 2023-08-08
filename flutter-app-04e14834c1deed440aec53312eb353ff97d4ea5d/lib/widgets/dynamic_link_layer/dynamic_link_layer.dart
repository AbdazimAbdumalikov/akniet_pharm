import 'package:europharm_flutter/network/repository/hive_repository.dart';
import 'package:europharm_flutter/screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:europharm_flutter/screens/onboarding_screen/onboarding_screen.dart';
import 'package:europharm_flutter/widgets/custom_loading_page.dart';
import 'package:europharm_flutter/widgets/dynamic_link_layer/bloc/dynamic_link_layer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DynamicLinkLayer extends StatelessWidget {
  final bool isAuthenticated;

  const DynamicLinkLayer({Key? key, required this.isAuthenticated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DynamicLinkLayerBloc>(
      create: (context) =>
          DynamicLinkLayerBloc(context.read<HiveRepository>(), isAuthenticated)
            ..add(InitialDynamicLinkLayerEvent()),
      child: BlocConsumer<DynamicLinkLayerBloc, DynamicLinkLayerState>(
        listener: (context, state) {
          if (state is CreateNewPasswordState) {}
          if (state is NotAuthorizedState) {}
        },
        buildWhen: (p, c) => c is AuthorizedState || c is NotAuthorizedState,
        builder: (context, state) {
          if (state is NotAuthorizedState) {
            return const OnBoardingScreen(); // return MapControlsPage();
          }
          if (state is AuthorizedState) {
            return const BottomNavigationBarScreen(); // return MapControlsPage();
          }
          return const CustomLoadingPage(
            bgColor: Colors.white, //Colors.red, /// FIXME
          );
        },
      ),
    );
  }
}

Future openDialog(BuildContext ctx, Widget dialog) =>
    Navigator.of(ctx, rootNavigator: true).push(
      MaterialPageRoute<bool>(
        builder: (BuildContext context) {
          return dialog;
        },
        fullscreenDialog: true,
      ),
    );
