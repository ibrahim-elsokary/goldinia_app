import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldinia_app/core/models/country_model.dart';
import 'package:goldinia_app/core/utils/country_list.dart';
import 'package:goldinia_app/features/home/pesentation/view_model/cubit/fetch_today_price_cubit.dart';

import 'country_flag.dart';

class CustomDropDownMenuForCountry extends StatelessWidget {
  const CustomDropDownMenuForCountry({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FetchTodayPriceCubit>(context);
    return BlocBuilder<FetchTodayPriceCubit, FetchTodayPriceState>(
      builder: (context, state) {
        return DropdownButton(
          value: cubit.countryModel,
          items: CountryList.countries.values.map((value) {
            return DropdownMenuItem(
              value: value,
              child: CountryFlag(imagePath: value.imagePath),
            );
          }).toList(),
          onChanged: (value) {
            cubit.countryModel = value;
            cubit.changeCountry(value!.endPointName);
          },
        );
      },
    );
  }
}
