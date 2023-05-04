import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/core/utils/constants.dart';
import 'package:goldinia_app/core/utils/country_list.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/core/utils/styles.dart';
import 'package:goldinia_app/features/home/pesentation/view/wallet_view.dart';
import 'package:goldinia_app/features/home/pesentation/view/widgets/custom_expanded_button.dart';
import 'package:goldinia_app/features/home/pesentation/view_model/cubit/manage_wallet_cubit.dart';

class CustomWalletWidget extends StatefulWidget {
  const CustomWalletWidget({
    super.key,
  });

  @override
  State<CustomWalletWidget> createState() => _CustomWalletWidgetState();
}

class _CustomWalletWidgetState extends State<CustomWalletWidget> {
  @override
  void initState() {
    var cubit = BlocProvider.of<ManageWalletCubit>(context);
    if (cubit.walletData.isNotEmpty) {
      cubit.fetchTodayGoldPrice(cubit.walletData[1]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ManageWalletCubit>(context);

    return BlocBuilder<ManageWalletCubit, ManageWalletState>(
      builder: (context, state) {
        if (cubit.walletData.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ExpandedButton(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WalletView(),
                ),
              ),
            ),
          );
        } else if (state is FetchTodayPriceSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 55),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Center(
                              child: Text(
                                '${cubit.walletData[3]} ${cubit.walletData[0]}',
                                style: Styles.fontStyle24Normal
                                    .copyWith(color: StyleColors.yellow),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        settings: RouteSettings(
                                            arguments: state.goldModel),
                                        builder: (context) =>
                                            const WalletView(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.edit_square)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: table(cubit.walletData, cubit.goldModel),
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Table table(List<String> walletData, GoldModel? goldModel) {
    var currentGoldPrice = goldModel?.goldprices
        .where((element) => element!.karatNumber == num.parse(walletData[2]))
        .first!
        .buyPrice;
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
            decoration: const BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(width: 1, color: StyleColors.gray))),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Text(
                  'current value',
                  style: Styles.fontStyle14Bold
                      .copyWith(color: StyleColors.yellow),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                  child: Text(
                walletData[0] == 'g'
                    ? currentGoldPrice!.round().toString()
                    : (currentGoldPrice! * ounceTogram).round().toString(),
                style: Styles.fontStyle14Normal,
              )),
              Center(
                  child: Text(
                walletData[0] == 'g'
                    ? (double.parse(walletData[3]) * currentGoldPrice)
                        .round()
                        .toString()
                    : ((double.parse(walletData[3]) * currentGoldPrice) *
                            ounceTogram)
                        .round()
                        .toString(),
                style: Styles.fontStyle14Normal,
              )),
              Text(
                '(${CountryList.countries[walletData[1]]?.currencyShortForm}/${walletData[0]})',
                style: Styles.fontStyle14Normal,
              ),
            ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'bought value',
              style: Styles.fontStyle14Bold.copyWith(color: StyleColors.yellow),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
              child: Text(
            walletData[4],
            style: Styles.fontStyle14Normal,
          )),
          Center(
              child: Text(
            (double.parse(walletData[4]) * double.parse(walletData[3]))
                .round()
                .toString(),
            style: Styles.fontStyle14Normal,
          )),
          Text(
            '(${CountryList.countries[walletData[1]]?.currencyShortForm}/${walletData[0]})',
            style: Styles.fontStyle14Normal,
          ),
        ]),
      ],
    );
  }
}
