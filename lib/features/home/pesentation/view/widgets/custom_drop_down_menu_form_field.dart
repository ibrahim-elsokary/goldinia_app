import 'package:flutter/material.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';

import '../../../../../core/utils/styles.dart';

class CustomDropDownMenuFormField extends StatelessWidget {
  const CustomDropDownMenuFormField({
    super.key,
    this.validator,
    this.onChanged,
    this.items,
    required this.label,
    this.hintText,
    this.value,
    this.onSaved,
  });
  final String? Function(dynamic)? validator;
  final void Function(dynamic)? onChanged;
  final void Function(dynamic)? onSaved;
  final List<DropdownMenuItem<dynamic>>? items;
  final String label;
  final String? hintText;
  final dynamic value;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onSaved: onSaved,
      value: value,
      validator: validator,
      decoration: InputDecoration(
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
      items: items,
      onChanged: onChanged,
    );
  }
}