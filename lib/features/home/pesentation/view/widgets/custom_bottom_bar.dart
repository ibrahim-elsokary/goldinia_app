import 'package:flutter/material.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_circular_button.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});
  @override
  Widget build(BuildContext context) {
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
          onTap: (value) {},
          items: const [
            BottomNavigationBarItem(
              icon: CustomCircularButton(
                icon: Text(
                  '14',
                  style: Styles.fontStyle24Normal,
                ),
                backgroundColor: 0 == 0 ? StyleColors.yellow : Colors.white,
                borderSide: BorderSide.none,
              ),
              label: '1',
            ),
            BottomNavigationBarItem(
              icon: CustomCircularButton(
                icon: Text(
                  '18',
                  style: Styles.fontStyle24Normal,
                ),
                backgroundColor: 0 == 1 ? StyleColors.yellow : Colors.white,
                borderSide: BorderSide.none,
              ),
              label: '2',
            ),
            BottomNavigationBarItem(
              icon: CustomCircularButton(
                icon: Text(
                  '21',
                  style: Styles.fontStyle24Normal,
                ),
                backgroundColor: 0 == 2 ? StyleColors.yellow : Colors.white,
                borderSide: BorderSide.none,
              ),
              label: '3',
            ),
            BottomNavigationBarItem(
              icon: CustomCircularButton(
                icon: Text(
                  '22',
                  style: Styles.fontStyle24Normal,
                ),
                backgroundColor: 0 == 3 ? StyleColors.yellow : Colors.white,
                borderSide: BorderSide.none,
              ),
              label: '4',
            ),
            BottomNavigationBarItem(
              icon: CustomCircularButton(
                icon: Text(
                  '24',
                  style: Styles.fontStyle24Normal,
                ),
                backgroundColor: 0 == 4 ? StyleColors.yellow : Colors.white,
                borderSide: BorderSide.none,
              ),
              label: '5',
            ),
          ]),
    );
  }
}