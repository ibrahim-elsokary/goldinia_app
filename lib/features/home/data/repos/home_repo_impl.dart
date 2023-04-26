import 'package:goldinia_app/core/utils/api_service.dart';
import 'package:goldinia_app/core/utils/errors/failure.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:dartz/dartz.dart';
import 'package:goldinia_app/features/home/data/repos/home_repo.dart';

class HomeImpl implements HomeRepo{

  final ApiService _apiService;

  HomeImpl(this._apiService);
  
  @override
  Future<Either<Failure, GoldModel>> fetchGoldPriceToday(String countryName) async{
    
     try {
       return right(GoldModel.Response(response: await _apiService.get(country: countryName), country: countryName));
     } catch (e) {
       return left(ParsingError("oops there is error try again later"));
     }

  }



}