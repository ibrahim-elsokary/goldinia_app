import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/core/utils/country_list.dart';
import 'package:goldinia_app/core/utils/karat_list.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/core/utils/styles.dart';
import 'package:goldinia_app/features/home/pesentation/view/widgets/country_flag.dart';
import 'package:goldinia_app/features/home/pesentation/view_model/cubit/manage_wallet_cubit.dart';

import 'custom_drop_down_menu_form_field.dart';
import 'custom_expanded_elevated_button.dart';
import 'custom_text_form_field.dart';

class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key, this.gold});
  final GoldModel? gold;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ManageWalletCubit>(context);
    final formKey = GlobalKey<FormState>();
    bool switchVlaue = true;
    String country = '';
    String weight = '';
    String boughtValue = '';
    String karat = '';
    List<String> args = [];
    return BlocBuilder<ManageWalletCubit, ManageWalletState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              'is weight in gram',
                              style: Styles.fontStyle18Normal,
                            ),
                            const Spacer(),
                            Switch(
                              value: cubit.walletIsGram,
                              onChanged: (value) {
                                cubit.changeWalletIsGramSwitch(value);
                                switchVlaue = value;
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomDropDownMenuFormField(
                          value: cubit.walletData.isNotEmpty
                              ? CountryList.countries[cubit.walletData[1]]
                              : null,
                          label: 'Country',
                          hintText: 'select country',
                          items: countryDropdownitems(),
                          validator: (value) {
                            if (value == null) {
                              return 'please select country';
                            }
                          },
                          onChanged: (value) {
                            country = value!.endPointName;
                          },
                          onSaved: (value) {
                            country = value!.endPointName;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomDropDownMenuFormField(
                          value: cubit.walletData.isNotEmpty
                              ? cubit.walletData[2]
                              : null,
                          label: 'Karat',
                          hintText: 'please select karat number',
                          items: karatDropdownitems(),
                          validator: (value) {
                            if (value == null) {
                              return 'please select karat number';
                            }
                          },
                          onChanged: (value) {
                            karat = value.toString();
                          },
                          onSaved: (value) {
                            karat = value.toString();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          value: cubit.walletData.isNotEmpty
                              ? cubit.walletData[3]
                              : null,
                          label: 'Weight',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter weight';
                            }
                          },
                          onSaved: (value) {
                            weight = value.toString();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          value: cubit.walletData.isNotEmpty
                              ? cubit.walletData[4]
                              : null,
                          label: 'Bought value',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter bought value';
                            }
                          },
                          onSaved: (value) {
                            boughtValue = value.toString();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FloatingActionButton(

                backgroundColor: Colors.red,
                child: const Icon(
                  size: 30,
                  Icons.delete_forever,
                ),
                onPressed: () {
                  cubit.deleteWallet();
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 20,),
              CustomExpandedElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    args = [
                      cubit.walletIsGram ? 'g' : 'oz',
                      country,
                      karat,
                      weight,
                      boughtValue
                    ];
                    cubit.addWallet(args);
                    cubit.fetchTodayGoldPrice(country);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}






List<DropdownMenuItem> countryDropdownitems() {
  return CountryList.countries.values.map((e) {
    return DropdownMenuItem(
      value: e,
      child: Row(
        children: [
          CountryFlag(imagePath: e.imagePath),
          const SizedBox(
            width: 10,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${e.name} (${e.currencyShortForm}) ',
            ),
          )
        ],
      ),
    );
  }).toList();
}

List<DropdownMenuItem> karatDropdownitems() {
  return karatList.map((e) {
    return DropdownMenuItem(
        value: e.toString(),
        child: Text(
          '$e karat ',
        ));
  }).toList();
}
