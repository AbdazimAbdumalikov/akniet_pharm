import 'package:flutter/material.dart';

class CustomLoadingPage extends StatelessWidget {
  final Color? bgColor;
  final Color? indicatorColor;
  const CustomLoadingPage({
    this.bgColor = Colors.white,
    this.indicatorColor = Colors.green,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            color: indicatorColor,
          ),
        ),
      ),
    );
  }
}
