import 'package:flutter/material.dart';
import 'custom_bottom_bar.dart';
import 'custom_home_app_bar.dart';
import 'golds_details_widget.dart';


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




