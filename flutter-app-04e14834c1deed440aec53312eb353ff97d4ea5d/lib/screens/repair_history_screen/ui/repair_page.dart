import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:europharm_flutter/screens/repair_history_screen/bloc/repair_page_bloc.dart';
import 'package:europharm_flutter/screens/repair_history_screen/widgets/repair_card.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/widgets/app_bottom_sheets/app_dialog.dart';
import 'package:europharm_flutter/widgets/app_loader_overlay.dart';
import 'package:europharm_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepairHistoryPage extends StatelessWidget {
  const RepairHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLoaderOverlay(
      child: Scaffold(
        backgroundColor: ColorPalette.background,
        appBar: const CustomAppBar(
          title: "История ремонта",
        ),
        body: BlocProvider(
          create: (context) =>
              RepairPageBloc(repository: context.read<GlobalRepository>()),
          child: BlocConsumer<RepairPageBloc, RepairPageState>(
            listener: (context, state) {
              if (state is RepairPageIsLoadingState) {
                context.loaderOverlay.show();
              } else {
                context.loaderOverlay.hide();
              }
              if (state is RepairPageLoadingErrorState) {
                showAppDialog(context, body: state.error.message);
              }
            },
            builder: (context, state) {
              if (state is RepairPageIsLoadedState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      for (int i = 0; i < state.repairs.length; i++)
                        RepairCard(repair: state.repairs[i])
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
