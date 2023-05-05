import 'package:flutter/material.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/core/utils/styles.dart';

class CustomExpandedElevatedButton extends StatelessWidget {
  const CustomExpandedElevatedButton({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text(
          'Add / Update',
          style: Styles.fontStyle18Normal,
        ),
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(StyleColors.yellow),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
          ),
        ),
      ),
    );
  }
}
