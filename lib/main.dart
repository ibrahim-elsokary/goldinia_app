import 'package:flutter/material.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:http/http.dart'as http;

void main() async{
   var response =
        await http.get(Uri.parse('https://lebanon.gold-price-today.com/'));

  var model = GoldModel.Response(response);
  model.goldprices.forEach((element) { print(element?.sellPrice);});
        
  runApp(const MaterialApp());
}
