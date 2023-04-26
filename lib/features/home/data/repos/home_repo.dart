import 'package:dartz/dartz.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/core/utils/errors/failure.dart';

abstract class HomeRepo{
   Future<Either<Failure,GoldModel>> fetchGoldPriceToday(String countryName); 
}