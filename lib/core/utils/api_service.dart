import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  
  ApiService();

  Future <Response> get ({required String country})async{
    return await http.get(Uri.parse('https://$country.gold-price-today.com/'));
  } 
}