

import 'package:goldinia_app/core/utils/functions/extract_list_of_number_from_string.dart';
import 'package:goldinia_app/core/utils/functions/string_contains_number.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart' as parser;

class GoldPrice {
  final int? karatNumber;
  final double? sellPrice;
  final double? buyPrice;
  GoldPrice(this.karatNumber, this.sellPrice, this.buyPrice);
}

class GoldModel {
  final String country;
  final List<GoldPrice?> goldprices;
  GoldModel(this.goldprices, this.country);

  factory GoldModel.Response({required Response response , required String country}) {
    // it is a web scarping method may be diffreant form website to another or when html respons change
    // it based on https://gold-price-today.com/
    var document = parser.parse(response.body);
    var rows = document.querySelectorAll('tr');
    return GoldModel(extractListOfGoldPrices(rows) , country);
  }
}

List<GoldPrice?> extractListOfGoldPrices(List<Element> rows){
  
  return rows.map((row) {
      bool conditionForLengthTow = row.children.length == 2 &&
          stringContainsNumber(row.children[0].text) &&
          stringContainsNumber(row.children[1].text);

      bool conditionForLengthThree = row.children.length == 3 &&
          stringContainsNumber(row.children[0].text) &&
          stringContainsNumber(row.children[1].text);

      if (conditionForLengthTow) {
        return GoldPrice(
          extractNumberListFromString(row.children[0].text)[0].toInt(),
          extractNumberListFromString(row.children[1].text)[1],
          extractNumberListFromString(row.children[1].text)[0],
        );
      } else if (conditionForLengthThree) {
        return GoldPrice(
          extractNumberListFromString(row.children[0].text)[0].toInt(),
          extractNumberListFromString(row.children[1].text)[0],
          extractNumberListFromString(row.children[1].text)[0]+50,
        );
      }
    }).toList().sublist(1,6);
}