import 'package:another_flushbar/flushbar.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:flutter/material.dart';

///snack bar for showing errors and other notifications
Future<void> showCustomSnackbar(
  BuildContext context,
  String content, {
  Color color = ColorPalette.errorRed,
  String? errorText,
}) async {
  await _buildCustomSnackBarWidget(
    context,
    content,
    errorText: errorText,
    color: color,
  ).show(context);
}

Flushbar _buildCustomSnackBarWidget(
  BuildContext context,
  String content, {
  Color color = ColorPalette.errorRed,
  String? errorText,
}) {
  return Flushbar(
    backgroundColor: Colors.transparent,
    padding: const EdgeInsets.all(0),
    margin: const EdgeInsets.only(top: 60),
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    duration: const Duration(seconds: 2),
    messageText: Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1ee94335),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              content,
              style: ProjectTextStyles.ui_14Semi.copyWith(color: color),
            ),
          ),
          Icon(
            Icons.close,
            size: 26,
            color: color,
          )
        ],
      ),
    ),
  );
}
