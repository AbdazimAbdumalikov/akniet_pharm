import 'package:europharm_flutter/network/models/user_dto.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:flutter/material.dart';

class EmployerCard extends StatefulWidget {
  final UserDTO driver;
  final bool isChosen;
  final Function({required UserDTO emptyDriver}) callBack;
  const EmployerCard({
    required this.driver,
    required this.isChosen,
    required this.callBack,
    Key? key,
  }) : super(key: key);

  @override
  State<EmployerCard> createState() => _EmployerCardState();
}

class _EmployerCardState extends State<EmployerCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.callBack(emptyDriver: widget.driver);
      },
      child: Row(
        children: [
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: CircleAvatar(),
          // ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.driver.name} ${widget.driver.surname}",
                style: ProjectTextStyles.ui_16Regular,
              ),
              // Text(
              //   "Водитель-экспедитор",
              //   style: ProjectTextStyles.ui_12Regular
              //       .copyWith(color: ColorPalette.gray),
              // ),
            ],
          ),
          const Spacer(),
          if (widget.isChosen) enabledCircle() else disabledCircle(),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  Container disabledCircle() {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xffEFF0F6),
        border: Border.all(
          color: const Color(0xffD9DBE9),
        ),
      ),
    );
  }

  Container enabledCircle() {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: ColorPalette.main,
      ),
      alignment: Alignment.center,
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
