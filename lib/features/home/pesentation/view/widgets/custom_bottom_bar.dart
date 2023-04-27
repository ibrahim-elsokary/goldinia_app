import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/features/home/pesentation/view_model/cubit/fetch_today_price_cubit.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_circular_button.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FetchTodayPriceCubit>(context);
    return BlocBuilder<FetchTodayPriceCubit, FetchTodayPriceState>(
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(bottom: 26, top: 26),
          height: 115,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: BottomNavigationBar(
              backgroundColor: StyleColors.brightYellow,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: StyleColors.yellow,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.bottomNavBarIndex,
              onTap: (value) {
                cubit.changeBottomBarIndex(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: CustomCircularButton(
                    icon: const Text(
                      '14',
                      style: Styles.fontStyle24Normal,
                    ),
                    backgroundColor:
                        cubit.bottomNavBarIndex == 0 ? StyleColors.yellow : Colors.white,
                    borderSide: BorderSide.none,
                  ),
                  label: '1',
                ),
                BottomNavigationBarItem(
                  icon: CustomCircularButton(
                    icon: const Text(
                      '18',
                      style: Styles.fontStyle24Normal,
                    ),
                    backgroundColor:
                        cubit.bottomNavBarIndex == 1 ? StyleColors.yellow : Colors.white,
                    borderSide: BorderSide.none,
                  ),
                  label: '2',
                ),
                BottomNavigationBarItem(
                  icon: CustomCircularButton(
                    icon: const Text(
                      '21',
                      style: Styles.fontStyle24Normal,
                    ),
                    backgroundColor:
                        cubit.bottomNavBarIndex == 2 ? StyleColors.yellow : Colors.white,
                    borderSide: BorderSide.none,
                  ),
                  label: '3',
                ),
                BottomNavigationBarItem(
                  icon: CustomCircularButton(
                    icon: const Text(
                      '22',
                      style: Styles.fontStyle24Normal,
                    ),
                    backgroundColor:
                        cubit.bottomNavBarIndex == 3 ? StyleColors.yellow : Colors.white,
                    borderSide: BorderSide.none,
                  ),
                  label: '4',
                ),
                BottomNavigationBarItem(
                  icon: CustomCircularButton(
                    icon: const Text(
                      '24',
                      style: Styles.fontStyle24Normal,
                    ),
                    backgroundColor:
                        cubit.bottomNavBarIndex == 4 ? StyleColors.yellow : Colors.white,
                    borderSide: BorderSide.none,
                  ),
                  label: '5',
                ),
              ]),
        );
      },
    );
  }
}
