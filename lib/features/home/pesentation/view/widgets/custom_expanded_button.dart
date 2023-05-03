import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class ExpandedButton extends StatelessWidget {
  const ExpandedButton({
    super.key, this.onTap,
  });
  final  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(20),
        width: double.infinity,
        child: Row(
          children: const[
            Text('follow your gold price',style: Styles.fontStyle18Normal,),
            Spacer(),
            Icon(Icons.add)
          ],
        ),
      ),
    );
  }
}