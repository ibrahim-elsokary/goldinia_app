import 'package:bloc/bloc.dart';
import 'package:goldinia_app/core/models/country_model.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/core/utils/country_list.dart';
import 'package:goldinia_app/core/utils/errors/failure.dart';
import 'package:goldinia_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_today_price_state.dart';

class FetchTodayPriceCubit extends Cubit<FetchTodayPriceState> {
  FetchTodayPriceCubit(this._homeRepo) : super(FetchTodayPriceInitial());
  final HomeRepo _homeRepo;
  int bottomNavBarIndex=0 ;
  CountryModel? countryModel = CountryList.countries[3];
  bool isGram = true; 
  late GoldModel _goldModel ;

  
  Future<void> fetchTodayGoldPrice(String countryName) async {
    emit(FetchTodayPriceLoading());
    var result = await _homeRepo.fetchGoldPriceToday(countryName);
    result.fold(
      (failure) {
        FetchTodayPriceFailure(failure.errorMsg);
      },
      (goldModel) {
        _goldModel = goldModel;
        emit(FetchTodayPriceSuccess(goldModel));
      },
    );
  }

  void changeBottomBarIndex(index){
    bottomNavBarIndex=index ;
    emit(ChangeNavBarSuccess());
    emit(FetchTodayPriceSuccess(_goldModel));
  }

  void changeWieghtUnit(bool isGram){
    this.isGram = isGram;
    emit(ChangeWieghtUnit());
    emit(FetchTodayPriceSuccess(_goldModel));
  }

    void changeCountry(String countryName){
    emit(ChangeCountry());
    fetchTodayGoldPrice(countryName);
  }
}

