import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/screens/documents_screen/bloc/bloc_documents_screen.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      appBar: CustomAppBar(
        title: S.of(context).documents,
      ),
      body: BlocConsumer<BlocDocumentsScreen, StateBlocDocumentsScreen>(
        builder: (context, state) {
          if (state is StateLoadDocumentsScreen) {
            return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: ColorPalette.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/images/svg/documents.svg"),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Voditelskoe_udostoverenie.pdf",
                                style: ProjectTextStyles.ui_16Medium,
                              )
                            ],
                          ),
                          SvgPicture.asset("assets/images/svg/download.svg"),
                        ],
                      ),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
