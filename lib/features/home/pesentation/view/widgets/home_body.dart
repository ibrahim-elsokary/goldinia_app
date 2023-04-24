import 'package:flutter/material.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/core/utils/styles.dart';
import 'package:goldinia_app/features/home/pesentation/view/widgets/custom_wallet_widget.dart';
import 'custom_drop_down_menu_for_country.dart';
import 'custom_home_app_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const CustomHomeAppBar(),
          const SizedBox(
            height: 45,
          ),
          Card(
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
                    child: Row(children: const [
                      Text(
                        'Gold Price 21',
                        style: Styles.fontStyle18SimiBold,
                      ),
                      Spacer(),
                      CustomDropDownMenuForCountry(),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomWalletWidget(),
                  const SizedBox(
                    height: 55,
                  ),
                  //Card(margin: EdgeInsets.zero,child: SizedBox(height: 100,child: Text('data'),width: double.infinity,),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

