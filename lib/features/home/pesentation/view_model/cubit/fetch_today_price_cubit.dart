import 'package:bloc/bloc.dart';
import 'package:goldinia_app/core/models/country_model.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/core/utils/country_list.dart';
import 'package:goldinia_app/core/utils/shared_preferences_helper.dart';
import 'package:goldinia_app/features/home/data/repos/home_repo.dart';


part 'fetch_today_price_state.dart';

class FetchTodayPriceCubit extends Cubit<FetchTodayPriceState> {
  FetchTodayPriceCubit(this._homeRepo) : super(FetchTodayPriceInitial());
  final HomeRepo _homeRepo;

  int bottomNavBarIndex = SharedPreferencesHelper.get(key: 'bottomNavBarIndex');

  CountryModel? countryModel = CountryList.countries[SharedPreferencesHelper.get(key: 'country')];

  bool isGram = SharedPreferencesHelper.get(key: 'isGram');
  
  late GoldModel _goldModel;

  /// ************* Start ******************

  Future<void> fetchTodayGoldPrice(String countryName) async {
    emit(FetchTodayPriceLoading());
    var result = await _homeRepo.fetchGoldPriceToday(countryName);
    result.fold(
      (failure) {
        FetchTodayPriceFailure(failure.errorMsg);
      },
      (goldModel) {
        _goldModel = goldModel;
        SharedPreferencesHelper.put(key: 'country', value: countryName);
        emit(FetchTodayPriceSuccess(goldModel));

      },
    );
  }

  void changeBottomBarIndex(index) {
    
    SharedPreferencesHelper.put(key: 'bottomNavBarIndex',value: index);
    bottomNavBarIndex = SharedPreferencesHelper.get(key: 'bottomNavBarIndex');
    emit(ChangeNavBarSuccess());
    emit(FetchTodayPriceSuccess(_goldModel));
  }

  void changeWieghtUnit(bool isGram) {
    SharedPreferencesHelper.put(key: 'isGram',value: isGram);
    this.isGram = SharedPreferencesHelper.get(key: 'isGram');
    emit(ChangeWieghtUnit());
    emit(FetchTodayPriceSuccess(_goldModel));
  }

  void changeCountry(String countryName) {
    emit(ChangeCountry());
    fetchTodayGoldPrice(countryName);
  }
}
