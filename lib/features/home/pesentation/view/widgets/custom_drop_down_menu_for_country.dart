import 'package:flutter/material.dart';
import 'package:goldinia_app/core/utils/country_list.dart';

import 'country_flag.dart';

class CustomDropDownMenuForCountry extends StatefulWidget {
  const CustomDropDownMenuForCountry({super.key});

  @override
  State<CustomDropDownMenuForCountry> createState() =>
      _CustomDropDownMenuForCountryState();
}

class _CustomDropDownMenuForCountryState
    extends State<CustomDropDownMenuForCountry> {
  String? selectedValue = 'Egypt';
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      items: CountryList.countries.map((e) {
        return DropdownMenuItem(
          value: e.name,
          child: CountryFlag(imagePath: e.imagePath),
        );
      }).toList(),
      onChanged: (value) {
        selectedValue = value;
        setState(() {});
      },
    );
  }
}
