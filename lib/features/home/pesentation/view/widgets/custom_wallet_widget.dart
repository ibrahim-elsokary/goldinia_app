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
      margin: EdgeInsets.symmetric(horizontal: 10),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    const Center(
                      child: Text(
                        '50G',
                        style: Styles.fontStyle24Normal,
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
            defaultVerticalAlignment:
                TableCellVerticalAlignment.middle,
            children: const [
              
              TableRow(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                              width: 1,
                              color: StyleColors.gray))),
                  children: [
                    Padding(
                      padding:  EdgeInsets.fromLTRB(
                          0, 15, 0, 15),
                      child: Text('current value',
                          textAlign: TextAlign.center),
                    ),
                    Center(child: Text('1966')),
                    Center(child: Text('98300')),
                    Text('(EGP/g)'),
                  ]),
              TableRow(children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15),
                  child: Text('bought value',
                      textAlign: TextAlign.center),
                ),
                Center(child: Text('1966')),
                Center(child: Text('98300')),
                Text('(EGP/g)'),
              ]),
            ],
          );
  }
}
