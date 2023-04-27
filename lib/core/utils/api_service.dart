import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  
  ApiService();

  Future <Response> get ({required String country})async{
    var x = await http.get(Uri.parse('https://$country.gold-price-today.com/'));
    return x;
  } 
}