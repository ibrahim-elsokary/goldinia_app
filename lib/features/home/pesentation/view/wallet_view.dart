import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';
import 'package:goldinia_app/features/home/pesentation/view/widgets/wallet_view_body.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});
  
  @override
  Widget build(BuildContext context) {
     
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: StyleColors.yellow,
        elevation: 0,
        title: Text('Wallet'),
      ),
      body: WalletViewBody(),
    );
  }
}