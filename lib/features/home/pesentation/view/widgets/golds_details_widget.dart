import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/core/utils/styles.dart';
import 'package:goldinia_app/features/home/pesentation/view_model/cubit/fetch_today_price_cubit.dart';

import 'custom_drop_down_menu_for_country.dart';
import 'custom_wallet_widget.dart';
import 'price_today_custom_widget.dart';

class GoldsDetailsWidget extends StatelessWidget {
  const GoldsDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FetchTodayPriceCubit>(context);
    
    return BlocBuilder<FetchTodayPriceCubit, FetchTodayPriceState>(
      builder: (context, state) {
        
        if (state is FetchTodayPriceSuccess  ) {
          return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Card(
            clipBehavior: Clip.hardEdge,
            color: StyleColors.brightYellow,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(children:  [
                      Text(
                        'Gold price ${state.goldModel.goldprices[cubit.bottomNavBarIndex]!.karatNumber}',
                        style: Styles.fontStyle18SimiBold,
                      ),
                      const Spacer(),
                      const CustomDropDownMenuForCountry(),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomWalletWidget(),
                  const SizedBox(
                    height: 55,
                  ),
                   PriceTodayCustomWidget(goldPrice: state.goldModel.goldprices[cubit.bottomNavBarIndex]!,weightUnit: cubit.isGram?"g":"oz" ,countryModel: cubit.countryModel!),
                ],
              ),
            ),
          ),
        );
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
