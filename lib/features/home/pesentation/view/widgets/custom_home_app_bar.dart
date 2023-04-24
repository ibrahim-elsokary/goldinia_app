import 'package:flutter/material.dart';
import 'package:goldinia_app/core/utils/styles.dart';

import 'custom_circular_button.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('GOLDINIA', style: Styles.fontStyle30SimiBold),
            Text('watch gold price today',
                style: Styles.fontStyle14Normal),
          ],
        ),
        const Spacer(),
        const CustomCircularButton(
            icon: Icon(Icons.notifications_none_rounded)),
        const SizedBox(
          width: 11,
        ),
        const CustomCircularButton(icon: Icon(Icons.menu)),
      ],
    );
  }
}
