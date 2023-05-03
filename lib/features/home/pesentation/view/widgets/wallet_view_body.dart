

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/core/utils/country_list.dart';
import 'package:goldinia_app/core/utils/karat_list.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/core/utils/styles.dart';
import 'package:goldinia_app/features/home/pesentation/view/widgets/country_flag.dart';
import 'package:goldinia_app/features/home/pesentation/view_model/cubit/manage_wallet_cubit.dart';

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
              IconButton(onPressed: () {
                
              }, icon:const Icon(Icons.delete_forever_outlined,size:40,)),
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
