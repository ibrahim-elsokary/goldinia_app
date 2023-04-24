import 'package:flutter/material.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/core/utils/styles.dart';
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
            color: StyleColors.brightYellow,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


