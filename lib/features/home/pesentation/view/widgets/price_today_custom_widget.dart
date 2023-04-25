// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/core/utils/styles.dart';

class PriceTodayCustomWidget extends StatelessWidget {
  const PriceTodayCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: const [
          CustomSellAndBuyWidget(),
          SizedBox(
            height: 7,
          ),
          LowerAndHigherPriceSection(),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: CustomSwitchButton(),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class CustomSellAndBuyWidget extends StatelessWidget {
  const CustomSellAndBuyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
            decoration: const BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(width: 1, color: StyleColors.gray),
              ),
            ),
            children: [
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'Sell',
                  textAlign: TextAlign.center,
                  style: Styles.fontStyle18SimiBold.copyWith(color: Colors.black),
                ),
              ),
              const Center(
                  child: Text(
                '1966',
                style: Styles.fontStyle18Normal,
              )),
              const Center(
                  child: Text(
                '(EGP/g)',
                style: Styles.fontStyle18Normal,
              )),
              Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline),
                ),
              ),
            ]),
        TableRow(
            decoration: const BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(width: 1, color: StyleColors.gray),
              ),
            ),
            children: [
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'buy',
                  textAlign: TextAlign.center,
                  style: Styles.fontStyle18SimiBold.copyWith(color: Colors.black),
                ),
              ),
              const Center(
                  child: Text(
                '1866',
                style: Styles.fontStyle18Normal,
              )),
              const Center(
                  child: Text(
                '(EGP/g)',
                style: Styles.fontStyle18Normal,
              )),
              Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline),
                ),
              ),
            ]),
      ],
    );
  }
}

class LowerAndHigherPriceSection extends StatelessWidget {
  const LowerAndHigherPriceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Text(
                'higher price',
                style: Styles.fontStyle18SimiBold.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '1989(EGP)',
                style: Styles.fontStyle18Normal,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Text(
                'lower price',
                style: Styles.fontStyle18SimiBold.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '1989(EGP)',
                style: Styles.fontStyle18Normal,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomSwitchButton extends StatefulWidget {
  const CustomSwitchButton({super.key});

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  @override
  bool _leftButtonActive = false;
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 35,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _leftButtonActive = true;
                  });
                },
                style: selectedButtonStyle(_leftButtonActive),
                child: const Text(
                  'gram(g)',
                 
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 35,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _leftButtonActive = false;
                  });
                },
                style: selectedButtonStyle(!_leftButtonActive),
                child: const Text(
                  'ounce(oz)',
                  
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ButtonStyle selectedButtonStyle(bool leftbuttonActive) {
    if (leftbuttonActive) {
      return ElevatedButton.styleFrom(
        backgroundColor: StyleColors.yellow,
        foregroundColor: Colors.white,
      );
    } else {
      return ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: StyleColors.gray,
      );
    }
  }
}
