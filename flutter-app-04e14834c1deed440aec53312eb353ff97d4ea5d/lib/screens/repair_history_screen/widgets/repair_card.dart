import 'package:europharm_flutter/network/models/repairs.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RepairCard extends StatelessWidget {
  const RepairCard({Key? key, required this.repair}) : super(key: key);

  final Repairs repair;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(repair.transportMarkModel ?? '',
                      style: ProjectTextStyles.ui_14Semi),
                  const Spacer(),
                  Text('Регулярный',
                      style: ProjectTextStyles.ui_14Regular
                          .copyWith(color: ColorPalette.main)),
                ],
              ),
              Row(
                children: [
                  Text(
                    repair.transportNumber ?? '',
                    style: ProjectTextStyles.ui_14Semi
                        .copyWith(color: ColorPalette.darkGrey),
                  ),
                  const Spacer(),
                  Text(
                      '${repair.startDate != null ? DateFormat("dd MMMM, HH:mm").format(repair.startDate!) : "-"} / ${repair.endDate != null ? DateFormat("dd MMMM, HH:mm").format(repair.endDate!) : "-"}',
                      style: ProjectTextStyles.ui_10Regular),
                ],
              ),
              const SizedBox(height: 5),
              Text('Категория: ${repair.category}',
                  style: ProjectTextStyles.ui_14Regular),
              Text('Подробнее: ${repair.name}',
                  style: ProjectTextStyles.ui_14Regular),
            ],
          ),
        ),
      ),
    );
  }
}
