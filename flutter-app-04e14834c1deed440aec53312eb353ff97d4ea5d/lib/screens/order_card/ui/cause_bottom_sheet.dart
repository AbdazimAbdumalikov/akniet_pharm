import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<String> items = [
  "Перекус - 3 раза в сутки",
  "Сон - 1 раз в сутки",
  "Перерыв на 15 минут - 3 раз в сутки",
  "Другая причина",
  "Передаю заказ другому водителю",
];

// void showCauseBottomSheet(BuildContext context) {
//   showAppBottomSheet(
//     context,
//     initialChildSize: 0.45,
//     useRootNavigator: true,
//     child: const BuildCauses(),
//   );
// }

class BuildCauses extends StatefulWidget {
  const BuildCauses({Key? key}) : super(key: key);

  @override
  State<BuildCauses> createState() => _BuildCausesState();
}

class _BuildCausesState extends State<BuildCauses> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Center(
            child: Text(
              "Выберите причину остановки",
              style: ProjectTextStyles.ui_20Medium,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: ColorPalette.lightGrey,
            ),
            child: Text(
              "Частые опции",
              style: ProjectTextStyles.ui_12Medium
                  .copyWith(color: ColorPalette.darkGrey),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(items[index]);
                },
                child: _BuildItem(
                  item: items[index],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: ColorPalette.lightGrey,
              );
            },
            itemCount: items.length,
          )
        ],
      ),
    );
  }
}

class _BuildItem extends StatelessWidget {
  final String item;

  const _BuildItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(
            item,
            style: ProjectTextStyles.ui_16Medium,
            overflow: TextOverflow.ellipsis,
          )),
          SvgPicture.asset("assets/images/svg/chevrone_right.svg")
        ],
      ),
    );
  }
}
