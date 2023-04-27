// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/core/utils/styles.dart';
import 'package:goldinia_app/features/home/pesentation/view_model/cubit/fetch_today_price_cubit.dart';

class PriceTodayCustomWidget extends StatelessWidget {
  const PriceTodayCustomWidget({
    super.key,
    required this.goldPrice,
    required this.weightUnit,
  });
  final GoldPrice goldPrice;
  final String weightUnit;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          CustomSellAndBuyWidget(goldPrice: goldPrice, weightUnit: weightUnit),
          SizedBox(
            height: 7,
          ),
          LowerAndHigherPriceSection(goldPrice: goldPrice),
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
    required this.goldPrice,
    required this.weightUnit,
  });
  final GoldPrice goldPrice;
  final String weightUnit;
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
                  style:
                      Styles.fontStyle18SimiBold.copyWith(color: Colors.black),
                ),
              ),
              Center(
                  child: Text(
                goldPrice.sellPrice.toString(),
                style: Styles.fontStyle18Normal,
              )),
              Center(
                  child: Text(
                '(EGP/$weightUnit)',
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
                  style:
                      Styles.fontStyle18SimiBold.copyWith(color: Colors.black),
                ),
              ),
              Center(
                  child: Text(
                goldPrice.buyPrice.toString(),
                style: Styles.fontStyle18Normal,
              )),
              Center(
                  child: Text(
                '(EGP/$weightUnit)',
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
    required this.goldPrice,
  });
  final GoldPrice goldPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'higher price',
                style: Styles.fontStyle18SimiBold.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                (goldPrice.sellPrice! / 0.98).round().toString(),
                style: Styles.fontStyle18Normal,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'lower price',
                style: Styles.fontStyle18SimiBold.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                (goldPrice.sellPrice! / 1.01).round().toString(),
                style: Styles.fontStyle18Normal,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomSwitchButton extends StatelessWidget {
  const CustomSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FetchTodayPriceCubit>(context);
    return BlocBuilder<FetchTodayPriceCubit, FetchTodayPriceState>(
      builder: (context, state) {
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
                      cubit.changeWieghtUnit(true);
                    },
                    style: selectedButtonStyle(cubit.isGram),
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
                      cubit.changeWieghtUnit(false);
                    },
                    style: selectedButtonStyle(!cubit.isGram),
                    child: const Text(
                      'ounce(oz)',
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
