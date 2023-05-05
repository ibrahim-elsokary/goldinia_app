import 'package:flutter/material.dart';

import '../../../../../core/utils/style_colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSaved,
    required this.label,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.validator,
    this.value,
  });
  final Function(String?)? onSaved;
  final String label;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: StyleColors.yellow,
      onSaved: onSaved,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        floatingLabelStyle:
            Styles.fontStyle18Normal.copyWith(color: StyleColors.yellow),
        focusColor: StyleColors.yellow,
        label: Text(label),
        hintStyle: Styles.fontStyle18Normal,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: StyleColors.yellow, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}