import 'package:flutter/material.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/features/home/pesentation/view/home_view.dart';
import 'package:http/http.dart' as http;

void main() async {
  var response =
      await http.get(Uri.parse('https://egypt.gold-price-today.com/'));

  var model = GoldModel.Response(response: response, country: "egypt");
  model.goldprices.forEach((element) {
    print(element?.sellPrice);
  });

  runApp(const GoldiniaApp());
}

class GoldiniaApp extends StatelessWidget {
  const GoldiniaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
