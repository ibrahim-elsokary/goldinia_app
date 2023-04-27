import 'package:flutter/material.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/core/utils/styles.dart';
import 'package:goldinia_app/features/home/pesentation/view/widgets/custom_circular_button.dart';
import 'package:goldinia_app/features/home/pesentation/view/widgets/custom_wallet_widget.dart';
import 'custom_bottom_bar.dart';
import 'custom_drop_down_menu_for_country.dart';
import 'custom_home_app_bar.dart';
import 'golds_details_widget.dart';
import 'price_today_custom_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: const  [
           SizedBox(
            height: 10,
          ),
           CustomHomeAppBar(),
           SizedBox(
            height: 45,
          ),
          Expanded(child: GoldsDetailsWidget()),
           CustomBottomBar()
        ],
      ),
    );
  }
}




