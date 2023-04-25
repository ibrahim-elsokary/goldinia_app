import 'package:flutter/material.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/core/utils/styles.dart';

class CustomWalletWidget extends StatelessWidget {
  const CustomWalletWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                     Center(
                      child: Text(
                        '50G',
                        style: Styles.fontStyle24Normal.copyWith(color: StyleColors.yellow),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit_square)),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: table(),
          )
        ],
      ),
    );
  }

  Table table() {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
            decoration: const BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(width: 1, color: StyleColors.gray))),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Text(
                  'current value',
                  style: Styles.fontStyle14Bold
                      .copyWith(color: StyleColors.yellow),
                  textAlign: TextAlign.center,
                ),
              ),
              const Center(
                  child: Text(
                '1966',
                style: Styles.fontStyle14Normal,
              )),
              const Center(
                  child: Text(
                '98300',
                style: Styles.fontStyle14Normal,
              )),
              const Text(
                '(EGP/g)',
                style: Styles.fontStyle14Normal,
              ),
            ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'bought value',
              style: Styles.fontStyle14Bold.copyWith(color: StyleColors.yellow),
              textAlign: TextAlign.center,
            ),
          ),
          const Center(
              child: Text(
            '1966',
            style: Styles.fontStyle14Normal,
          )),
          const Center(
              child: Text(
            '98300',
            style: Styles.fontStyle14Normal,
          )),
          const Text(
            '(EGP/g)',
            style: Styles.fontStyle14Normal,
          ),
        ]),
      ],
    );
  }
}
